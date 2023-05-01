# frozen_string_literal: true

# required variable : logged_in_store
shared_context 'when store logged in' do
  # NOTE: 変数名をparamsにすると、他のparamsと名前衝突するので、logged_in_paramsにしている。
  let(:logged_in_params) { { store_id: logged_in_store.id, password: logged_in_store.password } }

  before { post api_convenience_store_session_path, params: logged_in_params }
end
