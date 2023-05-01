# frozen_string_literal: true

def parsed_response
  JSON.parse(response.body, symbolize_names: true)
end

# MEMO: 以下のコードは動的に定義しても良いかも。

# required variable: request
# required variable: expect_result
RSpec.shared_examples 'response is expect_result' do
  it {
    request
    expect(parsed_response).to eq expect_result
  }
end

# required variable: request
RSpec.shared_examples 'response is bad request' do
  it {
    request
    expect(parsed_response).to eq({ error_message: 'bad request' })
  }
end

# required variable: request
RSpec.shared_examples 'response is not found' do
  it {
    request
    expect(parsed_response).to eq({ message: 'not found' })
  }
end
