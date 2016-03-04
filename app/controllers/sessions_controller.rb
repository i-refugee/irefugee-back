class SessionsController < ApplicationController
   skip_before_filter :verify_authenticity_token

  

  def create
    @center=Center.find_by(email: params[:username])
    if @center.authenticate(params[:password])
      @token=@center.tokens.create
      if @token.save
        #render json: @token, status: 201
        render json: { access_token: @token.auth_token, token_type: "bearer"}, status: 200

     else
       render json: @token.errors, status: 422
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

end
