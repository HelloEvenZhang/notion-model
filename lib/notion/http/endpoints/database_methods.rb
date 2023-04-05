# frozen_string_literal: true

module Notion
  module Http
    module Endpoints
      # Notion::Http::Client.new(token: NOTION_TOKEN).retrieve_a_database(DATABASE_ID)
      module DatabaseMethods
        # Retrieves a database object.
        def retrieve_a_database(options = {})
          raise Notion::Errors::ParamError, "Missing required params :database_id" if options[:database_id].nil?

          get("databases/#{options[:database_id]}")
        end

        # Gets a list of Pages contained in the database, filtered and ordered
        # according to the filter conditions and sort criteria provided in the request.
        def query_a_database(options = {})
          raise Notion::Errors::ParamError, "Missing required params :database_id" if options[:database_id].nil?

          database_id = options.delete(:database_id)
          post("databases/#{database_id}/query", options)
        end

        # Creates a database as a subpage in the specified parent page, with the specified properties schema.
        def create_a_database(options = {})
          raise Notion::Errors::ParamError, "Missing required params :parent.page_id" if options.dig(:parent, :page_id).nil?
          raise Notion::Errors::ParamError, "Missing required params :parent.properties" if options[:properties].nil?

          post("databases", options)
        end

        # Update the title, description, or properties of a specified database. Properties define the columns of a database.
        def update_a_database(options = {})
          raise Notion::Errors::ParamError, "Missing required params :database_id" if options[:database_id].nil?

          database_id = options.delete(:database_id)
          patch("databases/#{database_id}", options)
        end
      end
    end
  end
end
