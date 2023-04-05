# frozen_string_literal: true

module Notion
  module Http
    module Endpoints
      # Notion::Http::Client.new.retrieve_a_page(page_id)
      module PageMethods
        # Retrieves a Page object using the ID specified.
        def retrieve_a_page(options = {})
          raise Notion::Errors::ParamError, "Missing required params :page_id" if options[:page_id].nil?

          get("pages/#{options[:page_id]}")
        end

        # Retrieves a property_item object for a given page_id and property_id.
        def retrieve_a_page_property_item(options = {})
          raise Notion::Errors::ParamError, "Missing required params :page_id" if options[:page_id].nil?
          raise Notion::Errors::ParamError, "Missing required params :property_id" if options[:property_id].nil?

          get("pages/#{options[:page_id]}/properties/#{options[:property_id]}")
        end

        # Creates a new page that is a child of an existing page.
        def create_a_page(options = {})
          if options.dig(:parent, :page_id).nil? && options.dig(:parent, :database_id).nil?
            raise Notion::Errors::ParamError, "Missing required params :parent.page_id or :parent.database_id"
          end
          raise Notion::Errors::ParamError, "Missing required params :parent.properties" if options[:properties].nil?

          post("pages", options)
        end

        # Updates the properties of a page in a database.
        def update_page(options = {})
          raise Notion::Errors::ParamError, "Missing required params :page_id" if options[:page_id].nil?

          page_id = options.delete(:page_id)
          patch("pages/#{page_id}", options)
        end
      end
    end
  end
end
