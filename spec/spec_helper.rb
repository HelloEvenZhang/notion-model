# frozen_string_literal: true

require "dotenv/load"
require "vcr"
require "webmock/rspec"

require "notion"

Notion.configure do |config|
  config.token = ENV["NOTION_API_TOKEN"]
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/notion"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.before_record do |i|
    if ENV.key?("NOTION_API_TOKEN")
      i.request.headers["Authorization"].first.gsub!(ENV["NOTION_API_TOKEN"], "<NOTION_API_TOKEN>")
    end
    i.response.body.force_encoding("UTF-8")
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
