# frozen_string_literal: true

RSpec.describe Notion.config do
  before do
    Notion.configure do |config|
      config.token = "NOTION_TOKEN"
    end
  end

  it "notion can config" do
    expect(Notion.config.token).to eql("NOTION_TOKEN")
  end
end
