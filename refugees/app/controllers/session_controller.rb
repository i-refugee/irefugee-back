class SessionController < ApplicationController
   skip_before_filter :verify_authenticity_token

  

  def create
    @center=Center.find_by(email: params[:email])
    if @center.authenticate(params[:password])
      @token=@center.tokens.create
      if @token.save
        render json: @token, status: 201
     else
       render json: @token.errors, status: 422
     end
    else
      render json: { errors: "Username (email) or password missing,"}, status: 422
    end
  end
  
  def destroy
    auth_header = request.headers['Authorization']
    if auth_header
      temp = auth_header.split
      if temp.size == 2
        token = Token.find_by(auth_token: temp[1])
      else
        token = Token.find_by(auth_token: temp[0])
      end
      if token.nil?
        head 204
      else
        token.destroy
        head 204
      end
    else render json: { errors: "An error occured. Please try again."}, status: 500
    end
  end
  
end
