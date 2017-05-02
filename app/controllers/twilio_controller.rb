class TwilioController < ApplicationController
	include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

	def receive_sms
		content_type 'text/xml'

	    response = Twilio::TwiML::Response.new do |r|
	      r.Message "Welcome to FLEX. Friends who love exercising"
	    end
    render :xml => response.to_xml
  end




end
