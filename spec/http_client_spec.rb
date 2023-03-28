# frozen_string_literal: true

RSpec.describe Notion::HttpClient do
  it "Default Connection" do
    conn = Notion::HttpClient.default_connection
    expect(conn).to be_an_instance_of(Faraday::Connection)
  end
end
