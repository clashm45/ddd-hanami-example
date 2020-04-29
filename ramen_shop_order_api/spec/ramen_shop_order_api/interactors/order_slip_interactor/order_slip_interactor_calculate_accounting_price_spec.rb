# frozen_string_literal: true

require 'spec_helper'

describe OrderSlipInteractor::CalculateAccountingPrice do
  let(:repository) { OrderSlipRepository.new }

  context "good input" do
    let(:item_a) { ItemRepository.new.create({ name: "味噌ラーメン", price: 850 }) }
    let(:item_b) { ItemRepository.new.create({ name: "醤油ラーメン", price: 750 }) }
    let(:item_c) { ItemRepository.new.create({ name: "豚骨ラーメン", price: 800 }) }
    let(:order_slip) { OrderSlipInteractor::Create.new.call.order_slip }
    let(:attributes) { { order_slip_id: order_slip.id } }
    let(:interactor) { described_class.new }
    let(:result) { interactor.call(attributes) }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    context "複数の商品が含まれる場合" do
      before do
        add_item = OrderSlipInteractor::AddItem.new
        add_item.call({ order_slip_id: order_slip.id, item_id: item_a.id })
        add_item.call({ order_slip_id: order_slip.id, item_id: item_b.id })
        add_item.call({ order_slip_id: order_slip.id, item_id: item_c.id })
      end

      it "注文伝票に含まれる注文商品の金額の合計を返す" do
        expect(result.accounting_price).not_to be nil
        total_amount = item_a.price + item_b.price + item_c.price
        expect(result.accounting_price).to eq Money.new(total_amount, 'JPY')
      end
    end

    context "商品が1件だけ含まれる場合" do
      before do
        OrderSlipInteractor::AddItem.new.call({ order_slip_id: order_slip.id, item_id: item_a.id })
      end

      it "注文伝票に含まれる注文商品の金額の合計を返す" do
        expect(result.accounting_price).not_to be nil
        expect(result.accounting_price).to eq Money.new(item_a.price, 'JPY')
      end
    end

    context "商品が0件の場合" do
      it "注文伝票に含まれる注文商品の金額の合計を返す" do
        expect(result.accounting_price).not_to be nil
        expect(result.accounting_price).to eq Money.new(0, 'JPY')
      end
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

