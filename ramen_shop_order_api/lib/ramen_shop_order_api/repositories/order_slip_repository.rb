# frozen_string_literal: true

# 注文伝票 Repository
class OrderSlipRepository < Hanami::Repository
  associations do
    has_many :order_slip_items
    belongs_to :item, through: :order_slip_items
  end

  # 注文伝票(OrderSlip)を注文商品と一緒に検索する。
  # @param [Integer] id
  # @return [OrderSlip] 注文伝票
  def find_with_order_slip_items(id)
    aggregate(order_slip_items: :item).where(id: id).map_to(OrderSlip).one
  end

  # 注文伝票に注文したい商品を追加する。
  # @param [OrderSlip] order_slip
  # @param [Integer] item_id 商品ID
  # @return [OrderSlipItem] 追加した注文商品
  def add_item(order_slip, item_id)
    data = {
      item_id: item_id,
    }
    assoc(:order_slip_items, order_slip).add(data)
  end
end
