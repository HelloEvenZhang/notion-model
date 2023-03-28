# frozen_string_literal: true

module Notion
  module Endpoints
    # Notion::HttpClient.retrieve_a_database(database_id)
    module DatabaseMethods
      def retrieve_a_database(database_id)
        default_connection.get("databases/#{database_id}")
      end
    end
  end
end
