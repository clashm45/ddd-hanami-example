# frozen_string_literal: true

module Api
  module Controllers
    module OrderSlip
      class Create
        include Api::Action

        expose :order_slip

        def initialize(interactor: OrderSlipInteractor::Create.new)
          @interactor = interactor
        end

        # 注文伝票を作成する。
        # @return [OrderSlip] 作成した注文伝票
        def call(params)
          result = @interactor.call(params)
          if result.successful?
            @order_slip = result.order_slip
          else
            status 422, result.errors
          end
        end
      end
    end
  end
end
