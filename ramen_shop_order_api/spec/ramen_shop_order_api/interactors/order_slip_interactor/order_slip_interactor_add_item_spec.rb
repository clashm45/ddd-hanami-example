# frozen_string_literal: true

require 'spec_helper'

describe OrderSlipInteractor::AddItem do
  let(:repository) { OrderSlipRepository.new }

  context "good input" do
    let(:order_slip) { OrderSlipInteractor::Create.new.call.order_slip }
    let(:item) { ItemRepository.new.create({ name: "味噌ラーメン", price: 850 }) }
    let(:attributes) do
      {
        order_slip_id: order_slip.id,
        item_id:       item.id
      }
    end
    let(:interactor) { described_class.new(attributes) }
    let(:result) { interactor.call }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "注文伝票に注文商品が追加される" do
      expect(result.order_slip_item.id).to_not be nil
      order_slip_item = OrderSlipItemRepository.new.find_with_item(result.order_slip_item.id)
      expect(order_slip_item.item.name).to eq item.name
      expect(order_slip_item.item.price).to eq item.price
    end

    context "persistence" do
      let(:repository) { instance_double("OrderSlipRepository") }

      it "OrderSlipRepository#add_itemが呼ばれる" do
        expect(repository).to receive(:find)
        expect(repository).to receive(:add_item)
        described_class.new(attributes, repository: repository).call
      end
    end
  end

end


