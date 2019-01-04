# frozen_string_literal: true

#
# Handles different identities for the same user
#
class Identity < ApplicationRecord
  belongs_to :user

  validates :provider, :uid, :user, presence: true
  validates :uid, uniqueness: { scope: :provider }
end
