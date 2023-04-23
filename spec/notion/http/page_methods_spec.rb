# frozen_string_literal: true

RSpec.describe Notion::Http::Client do
  let(:client) { Notion::Http::Client.new }
  let(:page_id) { "a55fc778f59445f7a85326e2017cb403" }
  let(:database_id) { "4ebefa62437f4702ad6f673d8496f5ff" }
  let(:property_id) { "title" }
  let(:properties) do
    {
      Name:
       {
         title:
           [
             {
               text:
                 { content: "Test" }
             }
           ]
       }
    }
  end
  let(:update_properties) do
    {
      Money: {
        number: 150
      }
    }
  end

  it "retrieve_a_page", vcr: { cassette_name: "page_retrieve" } do
    page = client.retrieve_a_page(page_id: page_id)
    expect(page["properties"]["Name"]["title"].first["text"]["content"]).to eql("Good")
  end

  it "retrieve_a_page_property_item", vcr: { cassette_name: "page_property_retrieve" } do
    item = client.retrieve_a_page_property_item(page_id: page_id, property_id: property_id)
    expect(item["results"].length).to eql(1)
  end

  it "create_a_page", vcr: { cassette_name: "page_create" } do
    page = client.create_a_page(parent: { database_id: database_id }, properties: properties)
    expect(page["properties"]["Name"]["title"].first["text"]["content"]).to eql("Test")
  end

  it "update_page", vcr: { cassette_name: "page_update" } do
    page = client.update_page(page_id: page_id, properties: update_properties)
    expect(page["properties"]["Money"]["number"]).to eql(150)
  end
end
