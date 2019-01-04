# frozen_string_literal: true

class WoeidController < ApplicationController
  include StringUtils

  before_action :check_location

  def show
    @type = type_scope || "give"
    @status = status_scope || "currently_available"
    @q = params[:q]
    @page = params[:page]

    scope = Ad.public_send(@type).by_woeid_code(current_woeid).by_title(@q)
    scope = scope.public_send(@status) if @type == "give"

    @ads = policy_scope(scope).includes(:user, town: [:state, :country])
                              .recent_first
                              .page(@page)
  end

  private

  def check_location
    redirect_to location_ask_path if user_signed_in? && user_woeid.nil?

    return unless current_woeid

    @town = Town.find(current_woeid)
  end
end
