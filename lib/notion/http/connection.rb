# frozen_string_literal: true

require_relative "middlewares/raise_error"
require_relative "middlewares/mashie"

module Notion
  module Http
    # Initialize a ::Faraday::Connection
    module Connection
      private

      def connection
        @connection ||=
          begin
            options = {
              headers: {
                "User-Agent" => "notion-rb/#{Notion::VERSION}",
                "Authorization" => "Bearer #{token}",
                "Notion-Version" => Notion::DEFAULT_NOTION_VERSION,
                "Content-Type" => "application/json"
              }
            }

            options[:request] = { timeout: timeout } if timeout

            ::Faraday::Connection.new(endpoint, options) do |builder|
              builder.use Notion::Http::Middlewares::RaiseError
              builder.use ::Faraday::Mashify::Middleware, mash_class: Notion::Http::Middlewares::Mashie
              builder.use ::Faraday::Response::Json
            end
          end
      end
    end
  end
end
