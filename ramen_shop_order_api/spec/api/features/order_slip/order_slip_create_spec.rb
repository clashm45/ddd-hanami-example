# frozen_string_literal: true

require 'features_helper'

RSpec.describe 'Create Order Slip' do
  include Rack::Test::Methods
  let(:app) { Hanami.app }

  let(:repository) { OrderSlipRepository.new }

  before do
    repository.clear
  end

  context "POST /api/order_slip" do
    let(:do_request) do
      header 'Content-type', 'application/json'
      post '/api/order_slip'
    end

    let(:response_body) do
      order_slip = repository.last
      JSON.dump(order_slip.to_h)
    end

    it 'is empty by default' do
      do_request
      expect(last_response.status).to eq 200
      expect(last_response.content_type).to include "application/json"
      expect(last_response.body).to eq response_body
    end
  end
end
