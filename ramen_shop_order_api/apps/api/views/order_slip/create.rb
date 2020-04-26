# frozen_string_literal: true

require 'json'

module Api
  module Views
    module OrderSlip
      class Create
        include Api::View
        layout false

        def render
          _raw JSON.dump(order_slip.to_h)
        end
      end
    end
  end
end
