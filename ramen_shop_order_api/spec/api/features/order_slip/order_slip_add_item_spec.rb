# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'Add a Item to Order Slip' do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  let(:repository) { OrderSlipItemRepository.new }

  before do
    repository.clear
  end

  context "POST /api/order_slip" do
    let(:order_slip) { OrderSlipInteractor::Create.new.call.order_slip }
    let(:item) { ItemRepository.new.create(name: 'チャーハン', price: 750) }
    let(:attributes) do
      {
        'order_slip_id': order_slip.id,
        'item_id':       item.id,
      }
    end
    let(:do_request) do
      post '/api/order_slip/add_item', attributes
    end

    it '追加された注文商品が返ること' do
      do_request
      expect(last_response.status).to eq 200
      expect(last_response.content_type).to include "application/json"
      response_body = json_parse(last_response.body)
      expect(response_body[:id]).not_to eq nil
      expect(response_body[:order_slip_id]).to eq order_slip.id
      expect(response_body[:item_id]).to eq item.id
    end

    it '指定した商品が注文伝票に追加されていること' do
      do_request
      # DBから取得してみて、永続化されているかをチェック
      registered_order_slip = OrderSlipRepository.new.find_with_order_slip_items(order_slip.id)
      order_slip_item = registered_order_slip.order_slip_items.first
      response_body = json_parse(last_response.body)
      expect(response_body[:id]).to eq order_slip_item.id
      expect(order_slip_item.order_slip_id).to eq order_slip.id
      expect(order_slip_item.item_id).to eq item.id
    end
  end
end

