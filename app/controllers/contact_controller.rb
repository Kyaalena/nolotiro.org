# frozen_string_literal: true

class ContactController < ApplicationController
  # TODO: create model for Contact
  # TODO: deliver_later

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.email = current_user.email if user_signed_in?
    if verify_recaptcha(model: @contact) && @contact.valid?
      ContactMailer.contact_form(@contact.email, @contact.message, request).deliver_now
      redirect_to root_url, notice: t("nlt.contact_thanks")
    else
      render "new"
    end
  end
end
