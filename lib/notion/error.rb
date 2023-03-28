# frozen_string_literal: true

module Notion
  class Error < StandardError; end
  class HttpClientError < Error; end
end