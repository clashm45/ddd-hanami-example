module Api
  module Controllers
    module OrderSlip
      class AddItem
        include Api::Action

        expose :order_slip_item

        def initialize(interactor: OrderSlipInteractor::AddItem.new)
          @interactor = interactor
        end

        # 注文伝票に商品を追加する。
        # @return [OrderSlipItem] 注文した商品
        def call(params)
          result = @interactor.call(params)
          if result.successful?
            @order_slip_item = result.order_slip_item
          else
            status 422, result.error.to_json
          end
        end
      end
    end
  end
end
