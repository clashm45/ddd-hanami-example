module Api
  module Views
    module OrderSlip
      class CalculateAccountingPrice
        include Api::View

        # JPY ¥2,400
        def render
          _raw JSON.dump({ accounting_price: accounting_price.format })
        end
      end
    end
  end
end
