# frozen_string_literal: true

class MessageMailer < ActionMailer::Base
  default from: ENV["NLT_DEFAULT_FROM"]

  def send_email(message)
    @message = message
    @sender = message.sender
    @receiver = message.recipient
    @subject = t("message_mailer.subject_new", user: @sender.username)

    mail to: @receiver.email, subject: @subject, template_name: "new_message_email"
  end
end
