# frozen_string_literal: true

module Api
  module Controllers
    module Items
      class Index
        include Api::Action

        expose :items

        def initialize(interactor: ItemsInteractor::List.new)
          @interactor = interactor
        end

        def call(params)
          @items = @interactor.call.items
        end
      end
    end
  end
end
