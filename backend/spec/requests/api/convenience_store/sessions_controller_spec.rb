# frozen_string_literal: true

RSpec.describe Api::ConvenienceStore::SessionsController, type: :request do
  describe 'GET /api/convenience_store/session' do
    subject(:request) do
      get api_convenience_store_session_path
      JSON.parse(response.body, symbolize_names: true)
    end

    let(:store) { create(:store) }

    context 'when logged in store is present' do
      before { post api_convenience_store_session_path, params: params }

      let(:params) { { store_id: store.id, password: store.password } }

      it do
        request
        expect(response.code).to eq '200'
      end

      it { expect(request[:id]).to eq store.id }

      it { expect(request[:name]).to eq store.name }

      it { expect(request[:email]).to eq store.email }
    end

    context 'when logged in store is not present' do
      let(:expected_message) { "You can't use service." }

      it do
        request
        expect(response.code).to eq '401'
      end

      it { expect(request[:message]).to eq expected_message }
    end
  end

  describe 'POST /api/convenience_store/session' do
    subject(:request) do
      post api_convenience_store_session_path, params: params
      JSON.parse(response.body, symbolize_names: true)
    end

    let(:store) { create(:store) }

    context 'when login succeeds' do
      let(:params) { { store_id: store.id, password: store.password } }
      let(:expected_message) { 'ログインに成功しました。' }

      it do
        request
        expect(response.code).to eq '200'
      end

      it { expect(request[:message]).to eq expected_message }
    end

    context 'when there is no store associated with the store ID' do
      let(:params) { { store_id: 0, password: store.password } }
      let(:expected_message) { 'not found' }

      it do
        request
        expect(response.code).to eq '404'
      end

      it { expect(request[:message]).to eq expected_message }
    end

    context 'when the password is wrong' do
      let(:params) { { store_id: store.id, password: 'invalid password' } }
      let(:expected_message) { 'ログインに失敗しました。' }

      it do
        request
        expect(response.code).to eq '400'
      end

      it { expect(request[:error_message]).to eq expected_message }
    end
  end

  describe 'DELETE /api/convenience_store/session' do
    subject(:request) do
      delete api_convenience_store_session_path
      JSON.parse(response.body, symbolize_names: true)
    end

    let(:store) { create(:store) }

    context 'when logged in store is present' do
      before { post api_convenience_store_session_path, params: params }

      let(:params) { { store_id: store.id, password: store.password } }
      let(:expected_message) { 'success' }

      it do
        request
        expect(response.code).to eq '200'
      end

      it { expect(request[:message]).to eq expected_message }
    end

    context 'when logged in store is not present' do
      let(:expected_message) { "You can't use service." }

      it do
        request
        expect(response.code).to eq '401'
      end

      it { expect(request[:message]).to eq expected_message }
    end
  end
end
