# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    association :company
    last_name { '越智' }
    first_name { '翔一' }
    password { 'hogehoge' }
    email { 'test@gmail.com' }
    birthday { '1997-11-18' }
  end
end
