# frozen_string_literal: true

module Notion
  module Endpoints
    module DatabaseMethods
      def retrieve_a_database(database_id)
        default_connection.get("databases/#{database_id}")
      end
    end
  end
end