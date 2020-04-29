# frozen_string_literal: true

require 'hanami/interactor'

module OrderSlipInteractor
  class Create
    include Hanami::Interactor

    expose :order_slip

    def initialize(repository: OrderSlipRepository.new)
      @repository = repository
    end

    def call(params = {})
      @order_slip = @repository.create(params)
    end
  end
end
