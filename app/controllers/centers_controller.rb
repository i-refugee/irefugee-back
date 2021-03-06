class CentersController < ApplicationController
#	before_action :authenticate_with_token_admin!, only: [:create]
	before_action :authenticate_with_token!, only: [:password_change]
	before_action only: [:update, :destroy, :upload] do |c|
		c.send(:find_and_authorize_resource, "center")
	end

	has_scope :slug

	def index
		if params[:me] == "true"
			render json: current_center
		else
			center=apply_scopes(Center).where(confirmed: true)
			render json:center
		end
	end

	def password_change
		current_center.password = params[:password]
		current_center.save
		render json: @center, status: 200
	end

	def upload
		if params[:file]
			@center.image = params[:file]
			if @center.save
				render json: @center, status: 200
			else
	        	saving_error @center
	        end
		else
			head 400
		end
	end

	def show
		center=Center.find_by(id: params[:id])
		unless center 
			head 404   
		else 
			render json:center
		end
	end

	def create
		center=Center.new(center_params)
		if center.save
       	 	render_created_resource center
      	else
        	saving_error center
        end
    end

    def update
		if @center.update_attributes(update_center_params)
			render_updated_resource @center
		else
			saving_error @center
		end
    end

    def destroy
    	@center.destroy
    	render_successful_destroy
    end

    def center_params
		params.require(:data).require(:attributes).permit(:email, 
			:description, :password, :password_confirmation, :name,
			:phone_number, :contact_email, :address, :latitude, :longitude, :refugees_number, :center_type)
	end

    def update_center_params
		params.require(:data).require(:attributes).permit(:email, 
			:description, :name,
			:phone_number, :contact_email, :address, :latitude, :longitude, :refugees_number, :center_type)
	end
end