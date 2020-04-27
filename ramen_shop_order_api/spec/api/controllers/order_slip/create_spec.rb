# frozen_string_literal: true

RSpec.describe Api::Controllers::OrderSlip::Create, type: :action do
  let(:action) { described_class.new }
  let(:interactor) { OrderSlipInteractor::Create.new }
  let(:params) { Hash[] }

  context 'with valid params' do
    it 'status 200' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
end
