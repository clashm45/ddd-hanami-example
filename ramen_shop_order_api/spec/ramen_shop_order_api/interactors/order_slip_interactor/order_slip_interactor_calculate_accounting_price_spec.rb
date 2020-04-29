# frozen_string_literal: true

require 'spec_helper'

describe OrderSlipInteractor::CalculateAccountingPrice do
  let(:repository) { OrderSlipRepository.new }

  context "good input" do
    let(:order_slip) do
      os = OrderSlipInteractor::Create.new.call.order_slip
      OrderSlipInteractor::AddItem.new.call({ order_slip_id: os.id, item_id: item.id })
      os
    end
    let(:item) { ItemRepository.new.create({ name: "味噌ラーメン", price: 850 }) }
    let(:attributes) do
      {
        order_slip_id: order_slip.id,
      }
    end
    let(:interactor) { described_class.new }
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "注文伝票に含まれる注文商品の金額の合計を返す" do
      expect(result.accounting_price).not_to be nil
      expect(result.accounting_price).to eq Money.new(item.price, 'JPY')
    end

  end

  context "bad input" do
    let(:attributes) { {} }
    let(:interactor) { described_class.new }
    let(:result) { interactor.call(attributes) }
    let(:errors) { result.error }

    it "failed" do
      expect(result.successful?).to be false
      expect(errors[:order_slip_id]).to eq(['is missing'])
    end
  end
end

