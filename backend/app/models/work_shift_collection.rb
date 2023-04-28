# frozen_string_literal: true

# WorkShiftのCollectionクラス
class WorkShiftCollection
  attr_reader :work_shifts, :store_id, :employee_id

  def initialize(work_shifts, store_id, employee_id)
    @work_shifts = work_shifts
    @store_id = store_id
    @employee_id = employee_id
  end

  def create!
    work_shifts.each do |work_shift|
      WorkShift.create!(
        store_id: store_id,
        employee_id: employee_id,
        work_shift_master_id: work_shift[:work_shift_master_id],
        day_of_week: work_shift[:day_of_week]
      )
    end
  end

  def find_or_create_by!
    work_shifts.map do |work_shift|
      WorkShift.find_or_create_by!(
        store_id: store_id,
        employee_id: employee_id,
        work_shift_master_id: work_shift[:work_shift_master_id],
        day_of_week: work_shift[:day_of_week]
      )
    end
  end
end
