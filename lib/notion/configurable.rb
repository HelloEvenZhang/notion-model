# frozen_string_literal: true

module Notion
  # Dynamic configuration
  module Configurable
    def configure
      yield config
    end

    def config
      @config ||= Configuration.new
    end

    def setup
      @config = nil
    end

    # Access Notion.config to get configurations
    class Configuration
      ATTRIBUTES = %i[token endpoint timeout].freeze

      attr_accessor(*ATTRIBUTES)

      def initialize
        @endpoint = "https://api.notion.com/v1"
        @timeout = 20
      end
    end
  end
end
