# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OrderSlipItemRepository, type: :repository do
  let(:repository) { described_class.new }

  before do
    repository.clear
  end

  describe "#find_with_item" do
    let(:item_repository) { ItemRepository.new }
    let(:order_slip_repository) { OrderSlipRepository.new }
    before do
      item_repository.clear

      item = item_repository.create(name: "醤油ラーメン", price: 700)
      order_slip = order_slip_repository.create({})
      repository.create(order_slip_id: order_slip.id, item_id: item.id)
    end

    let(:order_slip_item) { repository.last }
    let(:item) { item_repository.last }
    let(:result) { repository.find_with_item(order_slip_item.id) }

    it "注文商品に関連した商品が取得できること" do
      expect(result.item).not_to be nil
      expect(result.item.id).to eq item.id
      expect(result.item.name).to eq item.name
      expect(result.item.price).to eq item.price
    end
  end
end
