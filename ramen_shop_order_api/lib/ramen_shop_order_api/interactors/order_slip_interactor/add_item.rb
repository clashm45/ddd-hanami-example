# frozen_string_literal: true

require 'hanami/interactor'

module OrderSlipInteractor
  class AddItem
    include Hanami::Interactor

    expose :order_slip_item

    def initialize(repository: OrderSlipRepository.new)
      @repository = repository
    end

    # 注文伝票に商品を追加する
    # @return [OrderSlipItem] 追加した注文商品
    def call(params)
      order_slip = @repository.find(params[:order_slip_id])
      @order_slip_item = @repository.add_item(order_slip, params[:item_id])
    end

    class Validation
      include Hanami::Validations
      validations do
        required(:order_slip_id).value(:filled?)
        required(:item_id).value(:filled?)
      end
    end

    private

    def valid?(params)
      @validate_result = Validation.new(params).validate
      if @validate_result.failure?
        error(@validate_result.messages)
      end
      @validate_result.success?
    end
  end
end
