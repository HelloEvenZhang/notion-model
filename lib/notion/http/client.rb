# frozen_string_literal: true

module Notion
  module Http
    # For http request and response
    class Client
      include Connection
      include Request
      include Endpoints::DatabaseMethods
      include Endpoints::PageMethods

      attr_accessor(*Configurable::Configuration::ATTRIBUTES)

      def initialize(options = {})
        Notion::Configurable::Configuration::ATTRIBUTES.each do |key|
          send("#{key}=", options.fetch(key, Notion.config.send(key)))
        end
      end
    end
  end
end
