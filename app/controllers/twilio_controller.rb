class TwilioController < ApplicationController
	include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

	def receive_sms
    p Rails.application.secrets.twilio_account_sid
    p Rails.application.secrets.twilio_token
    p params
    reply
    render nothing: true
  end

  def reply
    message_body = params["Body"]
    from_number = '+12245215864'
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: '+17735766373',
      body: message_body
    )
  end


# find user by params 'from',
private
  def boot_twilio
    account_sid = Rails.application.secrets.twilio_account_sid
    account_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, account_token
  end
end
