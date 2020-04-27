require 'spec_helper'

# Controllerのテストでは、正常な入力／異常な入力で
# それぞれ意図したstatus codeやエラーメッセージを返していることを確認する。
RSpec.describe Api::Controllers::OrderSlip::AddItem, type: :action do
  let(:action) { described_class.new(interactor: interactor) }
  let(:interactor) { OrderSlipInteractor::AddItem.new }
  let(:repository) { OrderSlipRepository.new }

  let(:response) { action.call(params) }

  context 'with valid params' do
    let(:order_slip) { OrderSlipInteractor::Create.new.call.order_slip }
    let(:item) { ItemRepository.new.create(name: 'チャーハン', price: 750) }
    let(:params) do
      {
        'order_slip_id': order_slip.id,
        'item_id':       item.id,
      }
    end

    it 'status 200' do
      expect(response[0]).to eq(200)
      expect(response[1]['Content-Type']).to eq("application/json; charset=utf-8")
      expect(action.order_slip_item).not_to be nil
    end
  end

  context 'with invalid params' do
    let(:params) { {} }
    it 'returns HTTP client error' do
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      errors = response[2]
      error = json_parse(errors[0])
      expect(error[:order_slip_id]).to eq(['is missing'])
      expect(error[:item_id]).to eq(['is missing'])
    end
  end
end
