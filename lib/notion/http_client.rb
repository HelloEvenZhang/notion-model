# frozen_string_literal: true

require "faraday"

require "notion/endpoints/database_methods"
require "notion/endpoints/page_methods"

module Notion
  # For Http Client
  class HttpClient
    extend Endpoints::DatabaseMethods
    extend Endpoints::PageMethods

    class << self
      def default_connection
        Faraday.new(
          url: Notion.config.base_url,
          headers: {
            "Content-Type" => "application/json",
            "Authorization" => "Bearer #{Notion.config.token}",
            "Notion-Version" => Notion.config.version
          }
        )
      end
    end
  end
end
