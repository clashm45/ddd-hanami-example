module Api
  module Controllers
    module OrderSlip
      class CalculateAccountingPrice
        include Api::Action

        expose :accounting_price

        def initialize(interactor: OrderSlipInteractor::CalculateAccountingPrice.new)
          @interactor = interactor
        end

        def call(params)
          result = @interactor.call(params)
          if result.successful?
            @accounting_price = result.accounting_price
          else
            status 422, result.error.to_json
          end
        end
      end
    end
  end
end
