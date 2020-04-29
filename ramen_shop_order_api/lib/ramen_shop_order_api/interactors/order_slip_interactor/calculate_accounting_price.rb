require 'hanami/interactor'
require 'money'

module OrderSlipInteractor
  class CalculateAccountingPrice
    include Hanami::Interactor

    expose :accounting_price

    def initialize(repository: OrderSlipRepository.new)
      @repository = repository

      Money.rounding_mode = BigDecimal::ROUND_HALF_UP
    end

    # 注文伝票をもとに合計金額を計算する。
    # @return [Money] 合計金額(円)
    def call(params)
      order_slip = @repository.find_with_order_slip_items(params[:order_slip_id])
      total_amount = order_slip.order_slip_items.sum { |order_item| order_item.item.price }
      @accounting_price = Money.new(total_amount, 'JPY')
    end

    class Validation
      include Hanami::Validations
      validations do
        required(:order_slip_id).value(:filled?)
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