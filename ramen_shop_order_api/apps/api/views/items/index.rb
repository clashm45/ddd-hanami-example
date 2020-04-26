# frozen_string_literal: true

require "json"

module Api
  module Views
    module Items
      class Index
        include Api::View
        layout false

        def render
          _raw JSON.dump(
            items.map do |item|
              {
                name:  item.name,
                price: item.price.to_i,
              }
            end
          )
        end
      end
    end
  end
end
