require 'spec_helper'

RSpec.describe OrderSlipRepository, type: :repository do
  let(:repository) { described_class.new }

  before do
    repository.clear
  end

  describe "#find_with_order_slip_items" do
    context "注文伝票が存在しない場合" do
      it "nilを返すこと" do
        expect(repository.find_with_order_slip_items(0)).to be nil
      end
    end

    context "注文伝票が存在する場合" do
      context "注文商品が未登録の場合" do
        before do
          repository.create({})
        end
        let(:order_slip) { repository.last }
        let(:result) { repository.find_with_order_slip_items(order_slip.id) }

        it "注文商品が nil になること" do
          expect(result.order_slip_items).to eq []
        end
      end

      context "注文商品が登録済みの場合" do
        let(:item_repository) { ItemRepository.new }
        before do
          item_repository.clear

          item = item_repository.create(name: "醤油ラーメン", price: 700)
          order_slip = repository.create({})
          repository.add_item(order_slip, item.id)
        end
        let(:order_slip) { repository.last }
        let(:item) { item_repository.last }
        let(:result) { repository.find_with_order_slip_items(order_slip.id) }

        it "注文商品が 1 件取得できること" do
          expect(result.order_slip_items.length).to eq 1
          order_slip_item = result.order_slip_items.first
          expect(order_slip_item.order_slip_id).to eq order_slip.id
          expect(order_slip_item.item_id).to eq item.id
        end
      end
    end
  end
end
