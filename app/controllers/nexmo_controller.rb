require 'nexmo'

class NexmoController < ApplicationController

  skip_before_action :verify_authenticity_token
 
  def message
    nexmo = Nexmo::Client.new(key: 'efa27735', secret: '520fa669')

    @response = nexmo.send_message(from: 'Ruby', to: '886920085183', text: 'Hello world')

    render inline: "Successfully" if @response["status"] == "0"
  end
end