# frozen_string_literal: true

RSpec.describe Notion do
  it "Notion configuable" do
    Notion.configure do |config|
      config.token = "NOTIONTOKEN"
    end
    expect(Notion.config.token).to eql("NOTIONTOKEN")
  end
end
