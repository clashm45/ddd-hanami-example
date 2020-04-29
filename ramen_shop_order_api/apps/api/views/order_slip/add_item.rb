# frozen_string_literal: true

module Api
  module Views
    module OrderSlip
      class AddItem
        include Api::View

        def render
          _raw JSON.dump(order_slip_item.to_h)
        end
      end
    end
  end
end
