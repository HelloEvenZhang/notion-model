# frozen_string_literal: true

module Notion
  module Http
    module Endpoints
      # Notion::Http::Client.new(token: NOTION_TOKEN).retrieve_a_database(DATABASE_ID)
      module DatabaseMethods
        def retrieve_a_database(database_id)
          get("databases/#{database_id}")
        end
      end
    end
  end
end
