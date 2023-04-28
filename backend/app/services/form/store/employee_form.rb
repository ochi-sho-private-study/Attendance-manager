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

      def create!(store)
        ActiveRecord::Base.transaction do
          @current_employee = Employee.create!(common_employee_attributes(store))
          PositionAssignmentCollection.new(position_ids, current_employee.id).create!
          WorkShiftCollection.new(work_shifts, store.id, current_employee.id).create!
        end

        self
      end

      def update!(store)
        ActiveRecord::Base.transaction do
          position_collection = PositionAssignmentCollection.new(position_ids, current_employee.id)
                                                            .find_or_create_by!
          work_shift_collection = WorkShiftCollection.new(
            work_shifts, store.id, current_employee.id
          ).find_or_create_by!

          update_params = common_employee_attributes(store).merge(
            {
              position_assignments: position_collection,
              work_shifts: work_shift_collection
            }
          )

          current_employee.update!(update_params)
        end

        self
      end

      # NOTE: default_attributesには、position_idsとwork_shiftsは不要。
      #       update時のリクエストボディには、current_employeeのposition_idsとwork_shiftsが含まれる。
      def default_attributes
        { last_name: current_employee.last_name,
          first_name: current_employee.first_name,
          email: current_employee.email,
          birthday: current_employee.birthday }
      end

      private

      def common_employee_attributes(store)
        { last_name: last_name,
          first_name: first_name,
          email: email,
          password: password,
          birthday: birthday,
          company_id: store.company.id }
      end
    end
  end
end
