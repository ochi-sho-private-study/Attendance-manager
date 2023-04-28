# frozen_string_literal: true

# == Schema Information
#
# Table name: work_shifts
#
#  id                        :bigint           not null, primary key
#  day_of_week(シフトの曜日) :integer          not null
#  employee_id               :bigint           not null
#  store_id                  :bigint           not null
#  work_shift_master_id      :bigint           not null
#
# Indexes
#
#  index_work_shifts_on_employee_id           (employee_id)
#  index_work_shifts_on_store_id              (store_id)
#  index_work_shifts_on_work_shift_master_id  (work_shift_master_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (work_shift_master_id => work_shift_masters.id)
#
class WorkShift < ApplicationRecord
  belongs_to :employee
  belongs_to :store

  enum status: {
    sunday: 0,
    monday: 10,
    tuesday: 20,
    wednesday: 30,
    thursday: 40,
    friday: 50,
    saturday: 60
  }
end
