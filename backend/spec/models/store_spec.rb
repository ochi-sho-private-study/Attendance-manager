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
RSpec.describe Store, type: :model do
  describe 'validation' do
    subject(:validation) { store.valid? }

    let(:store) { build(:store, name: name, password: password) }

    context 'when name is persent' do
      let(:name) { 'セブンイレブン六本木一丁目店' }
      let(:password) { 'hogehuga' }

      it { is_expected.to be true }
    end

    context 'when name is empty character' do
      let(:name) { '' }
      let(:password) { 'hogehuga' }

      it { is_expected.to be false }
    end

    context 'when name is empty nil' do
      let(:name) { nil }
      let(:password) { 'hogehuga' }

      it { is_expected.to be false }
    end

    context 'when password is present and 6 length' do
      let(:name) { 'セブンイレブン六本木一丁目店' }
      let(:password) { 'abcdef' }

      it { is_expected.to be true }
    end

    context 'when password is present but less thsn 6 length' do
      let(:name) { 'セブンイレブン六本木一丁目店' }
      let(:password) { 'abcde' }

      it { is_expected.to be false }
    end

    context 'when password is empty character' do
      let(:name) { 'セブンイレブン六本木一丁目店' }
      let(:password) { '' }

      it { is_expected.to be false }
    end

    context 'when password is empty nil' do
      let(:name) { 'セブンイレブン六本木一丁目店' }
      let(:password) { nil }

      it { is_expected.to be false }
    end
  end
end
