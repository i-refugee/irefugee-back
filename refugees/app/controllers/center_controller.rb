class CenterController < ApplicationController
	before_action :authenticate_with_token_admin!, only: [:create]
	before_action only: [:update, :destroy] do |c|
		c.send(:find_and_authorize_resource, "center")
	end

	def index
		center=Center.all
		render json:center
	end

	def show
		center=Center.find_by(id: params[:center_id])
		render json:center
	end

	def create
		center=Center.new(name: params[:name],email: params[:email],password: params[:password], password_confirmation: params[:password_confirmation])
		if center.save
       	 	render json: center, status: 201
      	else
        	render json: center.errors, status: 422
        end
    end

    def update
		if @center.update(center_params)
			render_updated_resource @center
		else
			saving_error @center
		end
    end

    def destroy
    
    	@center.destroy
    	head 204
    end

    def center_params
		params.require(:center).permit(:email, 
			:phone_number, :description, :password, :password_confirmation, 
			:description, :phone_number, :contact_email, :address)
	end
	
end
