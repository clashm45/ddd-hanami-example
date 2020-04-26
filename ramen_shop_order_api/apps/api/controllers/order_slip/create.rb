module Api
  module Controllers
    module OrderSlip
      class Create
        include Api::Action

        accept :json

        expose :order_slip

        def initialize(interactor: OrderSlipInteractor::Create.new)
          @interactor = interactor
        end

        # 注文伝票を作成する。
        # @return [OrderSlip] 作成した注文伝票
        def call(params)
          @order_slip = @interactor.call.order_slip
        end
      end
    end
  end
end
