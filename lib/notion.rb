# frozen_string_literal: true

require "faraday"
require "faraday/mashify"

require_relative "notion/version"
require_relative "notion/configurable"
require_relative "notion/errors/error"
require_relative "notion/errors/http_error"
require_relative "notion/http/middlewares/raise_error"
require_relative "notion/http/middlewares/mashie"
require_relative "notion/http/connection"
require_relative "notion/http/request"
require_relative "notion/http/endpoints/database_methods"
require_relative "notion/http/endpoints/page_methods"
require_relative "notion/http/client"

module Notion
  extend Configurable
end
