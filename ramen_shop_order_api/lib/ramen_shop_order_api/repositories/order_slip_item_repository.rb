class OrderSlipItemRepository < Hanami::Repository
  associations do
    belongs_to :order_slip
    belongs_to :item
  end

  # 関連する商品と一緒に検索する
  # @param [Integer] id 注文商品ID
  def find_with_item(id)
    aggregate(:item).where(id: id).map_to(OrderSlipItem).one
  end
end
