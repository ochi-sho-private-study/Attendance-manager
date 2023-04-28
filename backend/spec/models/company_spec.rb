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
RSpec.describe Company, type: :model do
  describe 'validation' do
    subject(:validation) { company.valid? }

    let(:company) { build(:company, name: name) }

    context 'when name is persent' do
      let(:name) { 'イタンジ株式会社' }

      it { is_expected.to be true }
    end

    context 'when name is empty character' do
      let(:name) { '' }

      it { is_expected.to be false }
    end

    context 'when name is empty nil' do
      let(:name) { nil }

      it { is_expected.to be false }
    end
  end
end
