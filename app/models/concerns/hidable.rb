# frozen_string_literal: true

module Hidable
  def self.included(base)
    base.class_eval do
      scope :from_authors_whitelisting, ->(user) do
        joins(:user).merge(User.whitelisting(user))
      end

      scope :from_legitimate_authors, -> { joins(:user).merge(User.legitimate) }
    end
  end
end
