# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"

require "rails/test_help"

require "minitest/pride"
require "capybara/rails"
require "capybara/minitest"

require "support/unit"
require "support/controller"
require "support/integration"

# Configure database cleaning
DatabaseCleaner.clean_with(:truncation)
DatabaseCleaner.strategy = :truncation
