# frozen_string_literal: true

module Notion
  module Http
    module Middlewares
      # A middleware that raise Notion::Errors::HttpError
      class RaiseError < ::Faraday::Middleware
        def on_complete(env)
          return if env.success?

          body = env.body
          return unless body

          error_code = body["code"]
          error_message = body["message"]

          error_class = Notion::Errors::NOTION_ERROR_CODES[error_code]
          error_class ||= Notion::Errors::HttpError
          raise error_class.new(error_code, error_message, env.response)
        end

        def call(env)
          super
        rescue ::Faraday::TimeoutError, ::Faraday::ConnectionFailed
          raise Notion::Errors::TimeoutError.new("timeout_error", "A unified client error for timeouts")
        rescue ::Faraday::ParsingError
          parsing_error_message = "Raised by middlewares that parse the response, like the JSON response middleware."
          raise Notion::Errors::ParsingError.new("parsing_error", parsing_error_message, env.response)
        end
      end
    end
  end
end
