# frozen_string_literal: true

RSpec.describe Notion do
  it "Notion::Version" do
    expect(Notion::NOTION_VERSION).to eql("2022-06-28")
  end
end
