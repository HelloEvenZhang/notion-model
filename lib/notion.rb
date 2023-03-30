# frozen_string_literal: true

require "faraday"
require "faraday/mashify"

require_relative "notion/configurable"
require_relative "notion/errors/error"
require_relative "notion/errors/http_error"
require_relative "notion/http/client"
require_relative "notion/version"

module Notion
  extend Configurable
end
