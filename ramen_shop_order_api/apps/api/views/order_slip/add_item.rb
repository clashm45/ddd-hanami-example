require 'json'

module Api
  module Views
    module OrderSlip
      class AddItem
        include Api::View
        layout false

        def render
          _raw JSON.dump(order_slip_item.to_h)
        end
      end
    end
  end
end
