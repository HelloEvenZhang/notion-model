# frozen_string_literal: true

module Notion
  module Errors
    # Collect all standard errors
    class Error < StandardError
    end

    # Require Token before request
    class MissingTokenError < Error
      def initialize
        super("Token missing! Please use `Notion.config.token = YOUR_TOKEN` to set token.")
      end
    end

    class ParamError < Error
    end
  end
end
