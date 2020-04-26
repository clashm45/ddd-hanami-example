# frozen_string_literal: true

require 'hanami/interactor'

module ItemsInteractor
  class List
    include Hanami::Interactor

    expose :items

    def initialize(repository: ItemRepository.new)
      @repository = repository
    end

    def call
      @items = @repository.all
    end
  end
end
