# frozen_string_literal: true

# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  birthday        :datetime
#  email           :string(255)
#  first_name      :string(255)      not null
#  last_name       :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#
# Indexes
#
#  index_employees_on_company_id  (company_id)
#  index_employees_on_email       (email) UNIQUE
#  index_employees_on_last_name   (last_name)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Employee < ApplicationRecord
  belongs_to :company
  has_many :position_assignments, dependent: :destroy
  has_many :work_shifts, dependent: :destroy

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
end
