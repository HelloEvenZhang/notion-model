# frozen_string_literal: true

require "faraday"

require_relative "notion/configurable"
require_relative "notion/error"
require_relative "notion/http/client"
require_relative "notion/version"

module Notion
  extend Configurable
end
