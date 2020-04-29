# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'Calculate Accounting Price from Order Slip' do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  context "POST /api/order_slip/calculate_accounting_price" do
    let(:order_slip) { OrderSlipInteractor::Create.new.call.order_slip }
    before do
      item_repo = ItemRepository.new
      item_a = item_repo.create({ name: "味噌ラーメン", price: 850 })
      item_b = item_repo.create({ name: "醤油ラーメン", price: 750 })
      item_c = item_repo.create({ name: "豚骨ラーメン", price: 800 })

      add_item = OrderSlipInteractor::AddItem.new
      add_item.call({ order_slip_id: order_slip.id, item_id: item_a.id })
      add_item.call({ order_slip_id: order_slip.id, item_id: item_b.id })
      add_item.call({ order_slip_id: order_slip.id, item_id: item_c.id })
    end

    let(:do_request) do
      header 'Content-type', 'application/json'
      get '/api/order_slip/calculate_accounting_price', { order_slip_id: order_slip.id }
    end

    let(:response_body) do
      JSON.dump({ accounting_price: '¥2,400' })
    end

    it '注文商品の合計金額(JPYフォーマット ¥1,000 )が返る' do
      do_request
      expect(last_response.status).to eq 200
      expect(last_response.content_type).to include "application/json"
      expect(last_response.body).to eq response_body
    end
  end
end

