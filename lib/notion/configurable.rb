# frozen_string_literal: true

module Notion
  # Dynamic configuration
  # Notion.configure do |config|
  #   config.token = "YOUR_NOTION_TOKEN"
  #   config.base_url = "NOTION_BASE_URL"
  #   config.version = "NOTION_VERSION"
  # end
  # Access Notion.config to get configurations
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

    class Configuration
      attr_accessor :enable_access_log, :timeout, :token, :base_url, :version

      def initialize
        @enable_access_log = true
        @timeout = 60
        @base_url = "https://api.notion.com/v1"
        @version = "2022-06-28"
      end
    end
  end
end
