class CallsController < ApplicationController
    def index
  end
  def token
    token = Twilio::JWT::AccessToken.new ENV['TWILLIO_VIDEO_SID'], ENV['TWILLIO_VIDEO_SK'],  ENV['TWILLIO_VIDEO_APIKEY'],
    ttl: 3600,
    identity: params[:identity]

    # Grant access to Video
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = params[:roomName]
    token.add_grant grant
    respond_to do |format|
      format.json {
        render json:  token.to_jwt
       }
    end 
  end
end
