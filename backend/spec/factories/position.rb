# frozen_string_literal: true

FactoryBot.define do
  factory :position do
    association :company
    name { '店長' }
  end
end
