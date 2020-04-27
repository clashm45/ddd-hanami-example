# frozen_string_literal: true

require 'hanami/interactor'

module OrderSlipInteractor
  class Create
    include Hanami::Interactor

    expose :order_slip

    def initialize(repository: OrderSlipRepository.new)
      @repository = repository
    end

    def call(params = nil)
      @order_slip = @repository.create({})
    end
  end
end
