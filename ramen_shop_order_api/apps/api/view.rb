require 'json'

module Api
  module View
    include Hanami::View

    layout false

    format :json
  end
end