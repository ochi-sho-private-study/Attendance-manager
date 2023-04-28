# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id               :bigint           not null, primary key
#  name             :string(255)      not null
#  telephone_number :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Company < ApplicationRecord
  has_many :stores, dependent: :destroy
  has_many :positions, dependent: :destroy

  validates :name, presence: true
end
