# frozen_string_literal: true

# == Schema Information
#
# Table name: stores
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#
# Indexes
#
#  index_stores_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

# 店舗のモデル
class Store < ApplicationRecord
  belongs_to :company
  has_many :work_shifts, dependent: :destroy

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true
end
