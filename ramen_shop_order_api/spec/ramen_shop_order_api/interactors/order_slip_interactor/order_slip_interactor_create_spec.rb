# frozen_string_literal: true

require 'spec_helper'

describe OrderSlipInteractor::Create do
  let(:interactor) { described_class.new }
  let(:repository) { OrderSlipRepository.new }

  context "good input" do
    let(:result) { interactor.call }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "creates a Order Slip" do
      expect(result.order_slip.id).to_not be nil
    end

    context "persistence" do
      let(:repository) { instance_double("OrderSlipRepository") }

      it "persists the Book" do
        expect(repository).to receive(:create)
        described_class.new(repository: repository).call
      end
    end
  end

end

