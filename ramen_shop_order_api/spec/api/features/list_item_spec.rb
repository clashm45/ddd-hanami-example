RSpec.describe 'List items' do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  let(:repository) { ItemRepository.new }
  
  context "GET /api/items" do

    let(:do_request) do
      header 'Content-type', 'application/json'
      get '/api/items'
    end

    context "商品が0件の場合" do

      let(:response_body) { { items: [] } }

      it 'is empty by default' do
        do_request
        expect(last_response.status).to eq 200
        expect(last_response.content_type).to include "application/json"
        expect(last_response.body).to eq response_body
      end
    end

    context "商品が登録済みの場合" do
      before do
        repository.clear

        repository.create(name: '塩ラーメン', price: 750)
        repository.create(name: '豚骨ラーメン', price: 800)
      end

      let(:response_body) do
        {
          items:
            [
              {
                name:  '塩ラーメン',
                price: 750
              },
              {
                name:  '豚骨ラーメン',
                price: 800
              }
            ]
        }
      end

      it 'is json response of items' do
        do_request
        expect(last_response.status).to eq 200
        expect(last_response.content_type).to include "application/json"
        expect(last_response.body).to eq response_body
      end

    end
  end
end