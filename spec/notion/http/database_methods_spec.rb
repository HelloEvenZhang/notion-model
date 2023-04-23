# frozen_string_literal: true

RSpec.describe Notion::Http::Client do
  let(:client) { Notion::Http::Client.new }
  let(:page_id) { "4dc9ff6d206540c5a07301bbb28fb04e" }
  let(:database_id) { "4ebefa62437f4702ad6f673d8496f5ff" }
  let(:title) do
    [
      {
        text: {
          content: "test notion-rb"
        }
      }
    ]
  end
  let(:properties) do
    {
      Name: {
        title: {}
      }
    }
  end

  it "retrieve_a_database", vcr: { cassette_name: "database_retrieve" } do
    database = client.retrieve_a_database(database_id: database_id)
    expect(database["title"].first["plain_text"]).to eql "Hello, notion-rb"
  end

  it "query_a_database", vcr: { cassette_name: "database_query" } do
    pages = client.query_a_database(database_id: database_id)
    expect(pages["results"].length).to eql 1
  end

  it "create a database", vcr: { cassette_name: "database_create" } do
    database = client.create_a_database(parent: { page_id: page_id }, title: title, properties: properties)
    expect(database["title"].first["text"]["content"]).to eql("test notion-rb")
  end

  it "update_a_database", vcr: { cassette_name: "database_update" } do
    database = client.update_a_database(database_id: database_id)
    expect(database["title"].first["plain_text"]).to eql "Hello, notion-rb"
  end
end
