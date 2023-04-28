# frozen_string_literal: true

# == Schema Information
#
# Table name: positions
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_positions_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
RSpec.describe Position, type: :model do
  describe 'validation' do
    subject(:validation) { position.valid? }

    let(:position) { build(:position, name: name) }

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
