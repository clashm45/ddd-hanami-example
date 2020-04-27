# frozen_string_literal: true

RSpec.describe Api::Controllers::OrderSlip::Create, type: :action do
  let(:action) { described_class.new }
  let(:interactor) { OrderSlipInteractor::Create.new }
  let(:params) { Hash[] }

  let(:response) { action.call(params) }

  context 'with valid params' do
    it 'status 200' do
      response = action.call(params)
      expect(response[0]).to eq(200)
      expect(response[1]['Content-Type']).to eq("application/json; charset=utf-8")
      expect(action.order_slip).not_to be nil
    end
  end
end
