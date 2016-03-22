class SessionsController < ApplicationController
   skip_before_filter :verify_authenticity_token

  def create
    @center=Center.find_by(email: params[:username])
    if @center.authenticate(params[:password])
      if @center.confirmed == false
        render json: { errors: "Center not confirmed."}, status: 422
      else
        @token=@center.tokens.create
        if @token.save
        #render json: @token, status: 201
          render json: { access_token: @token.auth_token, token_type: "bearer"}, status: 200

         else
           render json: @token.errors, status: 422
         end
      end
    else
      render json: { errors: "Username (email) or password missing,"}, status: 422
    end
  end
  
  def destroy
    token = Token.find_by(auth_token: params[:token])
    if token.nil?
      resource_not_found "session"
    else    
      token.destroy
      head 204
    end
  end

  def recaptcha_auth
    captcha = params[:captcha_response]
    if captcha
      require 'net/http'

      data = { 'secret' => '', 'response' => captcha }

      response = Net::HTTP.post_form URI('https://www.google.com/recaptcha/api/siteverify'),data

      render json: response.body, status: 200
    else
      head 400
    end
  end


end
