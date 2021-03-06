# frozen_string_literal: true

class DismissalsController < ApplicationController
  before_action :authenticate_user!

  def create
    announcement = Announcement.find(params[:announcement_id])

    announcement.dismissals.create!(user: current_user)

    redirect_back fallback_location: root_path
  end
end
