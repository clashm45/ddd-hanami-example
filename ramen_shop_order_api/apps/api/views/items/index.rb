module Api
  module Views
    module Items
      class Index
        include Api::View
        layout false

        def render
          { items: [] }.to_json
        end
      end
    end
  end
end
