module Api
  module Controllers
    module Items
      class Index
        include Api::Action
        accept :json

        expose :items

        def call(params)
          @items = ItemRepository.new.all
        end
      end
    end
  end
end
