# frozen_string_literal: true

# MEMO: 以下のコードは動的に定義しても良いかも。

# required variable : request
RSpec.shared_examples 'status code is ok' do
  it {
    request
    expect(response).to have_http_status(:ok)
  }
end

# required variable : request
RSpec.shared_examples 'status code is no_content' do
  it {
    request
    expect(response).to have_http_status(:no_content)
  }
end

# required variable : request
RSpec.shared_examples 'status code is unauthorized' do
  it {
    request
    expect(response).to have_http_status(:unauthorized)
  }
end

# required variable : request
RSpec.shared_examples 'status code is bad_request' do
  it {
    request
    expect(response).to have_http_status(:bad_request)
  }
end

# required variable : request
RSpec.shared_examples 'status code is not_found' do
  it {
    request
    expect(response).to have_http_status(:not_found)
  }
end
