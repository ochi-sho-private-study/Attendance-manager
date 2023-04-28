# frozen_string_literal: true

FactoryBot.define do
  factory :position_assignment do
    association :employee
    association :position
  end
end
