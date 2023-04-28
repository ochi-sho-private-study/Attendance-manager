# frozen_string_literal: true

# == Schema Information
#
# Table name: position_assignments
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :bigint           not null
#  position_id :bigint           not null
#
# Indexes
#
#  index_position_assignments_on_employee_id  (employee_id)
#  index_position_assignments_on_position_id  (position_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (position_id => positions.id)
#
class PositionAssignment < ApplicationRecord
  belongs_to :employee
  belongs_to :position
end
