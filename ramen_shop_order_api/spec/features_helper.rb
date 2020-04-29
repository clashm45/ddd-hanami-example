# frozen_string_literal: true

# Require this file for feature tests
require_relative './spec_helper'

require 'capybara'
require 'capybara/rspec'

require 'json'
require 'hanami/utils/hash'

RSpec.configure do |config|
  config.include RSpec::FeatureExampleGroup

  config.include Capybara::DSL,           feature: true
  config.include Capybara::RSpecMatchers, feature: true
end

# Json to Hash(symbolize)
def json_parse(response_body)
  Hanami::Utils::Hash.symbolize(JSON.parse(response_body))
end
