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
RSpec.describe Employee, type: :model do
  describe 'validation' do
    subject(:validation) { employee.valid? }

    context 'when first_name is persent' do
      let(:employee) { build(:employee, first_name: '障子') }

      it { is_expected.to be true }
    end

    context 'when first_name is empty character' do
      let(:employee) { build(:employee, first_name: '') }

      it { is_expected.to be false }
    end

    context 'when first_name is nil' do
      let(:employee) { build(:employee, first_name: nil) }

      it { is_expected.to be false }
    end

    context 'when last_name is persent' do
      let(:employee) { build(:employee, last_name: '異端児') }

      it { is_expected.to be true }
    end

    context 'when last_name is empty character' do
      let(:employee) { build(:employee, last_name: '') }

      it { is_expected.to be false }
    end

    context 'when last_name is nil' do
      let(:employee) { build(:employee, last_name: nil) }

      it { is_expected.to be false }
    end

    context 'when password is present and 6 length' do
      let(:employee) { build(:employee, password: 'abcdef') }

      it { is_expected.to be true }
    end

    context 'when password is present but less thsn 6 length' do
      let(:employee) { build(:employee, password: 'abcde') }

      it { is_expected.to be false }
    end

    context 'when password is empty character' do
      let(:employee) { build(:employee, password: '') }

      it { is_expected.to be false }
    end

    context 'when password is empty nil' do
      let(:employee) { build(:employee, password: nil) }

      it { is_expected.to be false }
    end

    context 'when email is present and valid format' do
      let(:employee) { build(:employee, email: 'test@co.jp') }

      it { is_expected.to be true }
    end

    context 'when email is present but invalid format' do
      let(:employee) { build(:employee, email: 'test') }

      it { is_expected.to be false }
    end

    context 'when email is not present' do
      let(:employee) { build(:employee, email: nil) }

      it { is_expected.to be false }
    end

    context 'when email is empty character' do
      let(:employee) { build(:employee, email: '') }

      it { is_expected.to be false }
    end
  end
end
