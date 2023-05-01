# frozen_string_literal: true

RSpec.describe Api::ConvenienceStore::PositionsController, type: :request do
  let(:logged_in_store) { create(:store) }

  include_context 'when store logged in'

  describe 'GET /index' do
    subject(:request) do
      get api_convenience_store_positions_path
      parsed_response
    end

    let!(:position) { create(:position, company: logged_in_store.company) }

    context 'when valid request' do
      it_behaves_like 'status code is ok'

      it 'position is reterned' do
        result = request[:positions][0][:name]
        expect(result).to eq position.name
      end
    end
  end

  describe 'GET /show' do
    subject(:request) do
      get api_convenience_store_position_path(position_id)
      parsed_response
    end

    let(:position) { create(:position, company: logged_in_store.company) }

    context 'when valid request' do
      let(:position_id) { position.id }

      it_behaves_like 'status code is ok'

      it 'id is returned' do
        expect(request[:id]).to eq position.id
      end

      it 'name is returned' do
        expect(request[:name]).to eq position.name
      end
    end

    context 'when position is not found' do
      let(:position_id) { 0 }

      it_behaves_like 'status code is not_found'

      it_behaves_like 'response is not found'
    end
  end

  describe 'POST /create' do
    subject(:request) do
      post api_convenience_store_positions_path, params: params
    end

    context 'when valid request' do
      let(:params) { { position: { name: 'オーナー' } } }

      it_behaves_like 'status code is ok'

      it 'position is posted' do
        expect { request }.to change(Position, :count).by(1)
      end
    end

    context 'when validation error raised' do
      let(:params) { { position: { name: '' } } }
      let(:expect_result) { { error_message: 'バリデーションエラーです。部署名を入力してください。' } }

      it_behaves_like 'status code is bad_request'

      it_behaves_like 'response is expect_result'
    end
  end

  describe 'PUT /upadte' do
    subject(:request) do
      put api_convenience_store_position_path(position_id), params: params
    end

    let(:position) { create(:position, company: logged_in_store.company, name: '店長') }

    context 'when valid request' do
      let(:position_id) { position.id }
      let(:params) { { position: { name: 'オーナー' } } }

      it_behaves_like 'status code is ok'

      it 'name is updated' do
        expect { request }.to change {
                                Position.find(position.id).name
                              }.from(position.name).to('オーナー')
      end
    end

    context 'when validation error raised' do
      let(:position_id) { position.id }
      let(:params) { { position: { name: '' } } }
      let(:expect_result) { { error_message: 'バリデーションエラーです。部署名を入力してください。' } }

      it_behaves_like 'status code is bad_request'

      it_behaves_like 'response is expect_result'
    end

    context 'when position is not found' do
      let(:position_id) { 0 }
      let(:params) { { position: { name: 'オーナー' } } }

      it_behaves_like 'status code is not_found'

      it_behaves_like 'response is not found'
    end
  end

  describe 'DELETE /destroy' do
    subject(:request) { delete api_convenience_store_position_path(position_id) }

    let!(:position) { create(:position, company: logged_in_store.company) }

    context 'when valid request' do
      let(:position_id) { position.id }

      it_behaves_like 'status code is no_content'

      it 'position is deleted' do
        expect { request }.to change(Position, :count).by(-1)
      end
    end

    context 'when position is not found' do
      let(:position_id) { 0 }

      it_behaves_like 'status code is not_found'

      it_behaves_like 'response is not found'
    end
  end
end
