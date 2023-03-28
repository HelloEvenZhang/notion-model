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
      attr_accessor :token, :base_url, :version

      def initialize
        @base_url = "https://api.notion.com/v1"
        @version = "2022-06-28"
      end
    end
  end
end
