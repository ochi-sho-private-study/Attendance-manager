# frozen_string_literal: true

# TODO: 店舗ログイン単位での機能がある程度完成したら、テスト対象にする。
# :nocov:
module Api
  module ConvenienceStore
    # 従業員のAPI
    class EmployeesController < ApplicationController
      def create
        form = Form::Store::EmployeeForm.new(create_params)
        response = form.create!(current_store)

        render json: response.current_employee
      end

      private

      def create_params
        params.require(:employee).permit(
          *Form::Store::EmployeeForm::ATTRIBUTES,
          position_ids: [],
          work_shifts: %i[work_shift_master_id day_of_week]
        ).to_hash.deep_symbolize_keys
      end
    end
  end
end
# :nocov:
