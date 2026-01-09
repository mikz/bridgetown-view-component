# frozen_string_literal: true

require "bridgetown"
require "tmpdir"

Bridgetown.begin!

# rubocop:disable Lint/Void
Bridgetown::Site # resolve weird autoload issue
# rubocop:enable Lint/Void
require File.expand_path("../lib/bridgetown-view-component", __dir__)
require_relative "support/bridgetown_site_context"

Bridgetown.logger.log_level = :error

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = "random"

  ROOT_DIR = File.expand_path("fixtures", __dir__)
  SOURCE_DIR = File.join(ROOT_DIR, "src")

  def root_dir(*files)
    File.join(ROOT_DIR, *files)
  end

  def source_dir(*files)
    File.join(SOURCE_DIR, *files)
  end
end
