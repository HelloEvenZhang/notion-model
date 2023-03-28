# frozen_string_literal: true

RSpec.describe Notion::HttpClient do
  context "DatabaseMethods" do
    before(:each) do
      Notion.config.token = "secret_362e5jgfEC79wUkvqsIDVhiMHbHvYZ7u0QT18BzFBhT"
    end
    it "Notion::HttpClient can retrieve a database" do
      res = Notion::HttpClient.retrieve_a_database("286c26e9707f4fc7be20ca6b26ed851b")
      expect(JSON.parse(res.body)["object"]).to eql("database")
    end
  end
end
