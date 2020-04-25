RSpec.describe 'List items' do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  let(:repository) { ItemRepository.new }
  before do
    repository.clear

    repository.create(name: '塩ラーメン', price: 750)
    repository.create(name: '豚骨ラーメン', price: 800)
  end

  context "GET /api/items" do
    before do
      header 'Content-type', 'application/json'
      get '/api/items'

      last_response
    end

    let(:response_body) do
      {
        items:
          [
            {
              name: '塩ラーメン',
              price: 750
            },
            {
              name: '豚骨ラーメン',
              price: 800
            }
          ]
      }
    end

    it 'is json response of items' do
      expect(last_response.status).to eq 200
      expect(last_response.content_type).to include "application/json"
      expect(last_response.body).to eq response_body
    end
  end
end