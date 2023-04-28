# frozen_string_literal: true

module Form
  module Store
    # 店舗ログイン時の従業員登録フォーム
    class EmployeeForm
      include ActiveModel::Model

      ATTRIBUTES = %i[password email last_name first_name birthday position_ids work_shifts].freeze

      attr_accessor :current_employee, *ATTRIBUTES

      def initialize(attributes = nil, employee: Employee.new)
        @current_employee = employee
        attributes = default_attributes.deep_merge(attributes)
        super(attributes)
      end

      def create!(store) # rubocop:disable Metrics/AbcSize
        ActiveRecord::Base.transaction do
          employee = Employee.create!(
            last_name: last_name,
            first_name: first_name,
            email: email,
            password: password,
            birthday: birthday,
            company_id: store.company.id
          )
          PositionAssignmentCollection.new(position_ids, employee.id).create!
          WorkShiftCollection.new(work_shifts, store.id, employee.id).create!
        end
      end

      def update!(store) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        ActiveRecord::Base.transaction do
          position_collection = PositionAssignmentCollection.new(position_ids, current_employee.id)
                                                            .find_or_create_by!
          work_shift_collection = WorkShiftCollection.new(
            work_shifts, store.id, current_employee.id
          ).find_or_create_by!

          current_employee.update!(
            last_name: last_name,
            first_name: first_name,
            email: email,
            password: password,
            birthday: birthday,
            company_id: store.company_id,
            position_assignments: position_collection,
            work_shifts: work_shift_collection
          )
        end
      end

      # NOTE: default_attributesには、position_idsとwork_shiftsは不要。
      #       update時のリクエストボディには、current_employeeのposition_idsとwork_shiftsが含まれる。
      def default_attributes
        {
          last_name: current_employee.last_name,
          first_name: current_employee.first_name,
          email: current_employee.email,
          birthday: current_employee.birthday
        }
      end
    end
  end
end
