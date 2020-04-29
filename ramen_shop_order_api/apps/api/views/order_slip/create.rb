# frozen_string_literal: true

module Api
  module Views
    module OrderSlip
      class Create
        include Api::View

        def render
          _raw JSON.dump(order_slip.to_h)
        end
      end
    end
  end
end
