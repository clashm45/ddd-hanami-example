class Seed

  def exec

    # 商品
    item_repo = ItemRepository.new
    item_a    = item_repo.create(name: '醤油ラーメン', price: 550)
    item_b    = item_repo.create(name: '味噌ラーメン', price: 650)
    item_c    = item_repo.create(name: '豚骨ラーメン', price: 600)

    # 注文伝票
    slip_create = OrderSlipInteractor::Create.new
    order_slip  = slip_create.call.order_slip

    # 注文
    slip_add_item = OrderSlipInteractor::AddItem.new
    slip_add_item.call({ order_slip_id: order_slip.id, item_id: item_a.id })
    slip_add_item.call({ order_slip_id: order_slip.id, item_id: item_b.id })
    slip_add_item.call({ order_slip_id: order_slip.id, item_id: item_c.id })

  end

end
