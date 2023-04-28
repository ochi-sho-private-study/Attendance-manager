# frozen_string_literal: true

# PositionAssignmentのCollectionクラス
class PositionAssignmentCollection
  attr_reader :position_ids, :employee_id

  def initialize(position_ids, employee_id)
    @employee_id = employee_id
    @position_ids = position_ids
  end

  def create!
    position_ids.each do |position_id|
      PositionAssignment.create!(
        employee_id: employee_id,
        position_id: position_id
      )
    end
  end

  def find_or_create_by!
    position_ids.map do |position_id|
      PositionAssignment.find_or_create_by!(
        employee_id: employee_id,
        position_id: position_id
      )
    end
  end
end
