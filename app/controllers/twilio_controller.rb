class TwilioController < ApplicationController
	include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def first_text

    response = Twilio::TwiML::Response.new do |r|
      r.Message "Thank you for using FLEX Chat! To message a flexmate please use the following template: To:(Flexmates Name) Body: 'Fill in message here'."
      end

    response.to_xml
  end

	def receive_sms
    if params["Body"].include?("Tutorial")
      first_text
    else
      reply
      render nothing: true
    end
  end

  def reply
    sender = User.find_by(phone: params["From"][2..-1])
    receiver_first_name =  params["Body"].match(/:(.*)/)[1][1..-1]
    receiver_number = User.find_by(first_name: receiver_first_name).phone
    text_body = params["Body"]
   # OUR METHOD
    message_body = text_body
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: "+1#{receiver_number}",
      body: message_body + "\n-From #{sender.first_name}"
    )
  end



# user.find_by params['from'], locate the recipient by the 'TO': info included in body of the text, update the 'reply' method and send along the body of the text.
private
  def boot_twilio
    account_sid = Rails.application.secrets.twilio_account_sid
    account_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, account_token
  end
end
