# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    association :company
    name { 'セブンイレブン六本木一丁目店' }
    password { 'hogehoge' }
  end
end
