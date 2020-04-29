# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Api::Views::Items::Index, type: :view do
  let(:exposures) { Hash[format: :json] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/items/index.html.erb') }
  let(:view)      { Api::Views::Items::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end
end
