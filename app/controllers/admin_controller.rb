class AdminController < ApplicationController
	before_action :authenticate_with_token_admin!, only: [:destroy]
	

	def index
		admin=Admin.all
		render json:admin
	end

	def show
		admin=Admin.find_by(id: params[:admin_id])
		unless admin 
			head 404
		else 
			render json:admin
		end
	end

	def create
		admin=Admin.new(email: params[:email],password: params[:password], password_confirmation: params[:password_confirmation])
		if admin.save
       	 	render json:admin, status: 201
      	else
        	render json:admin.errors, status: 422
        end
    end

    

    def destroy
    	admin=current_admin
    	admin.destroy
    	head 204
    end
end
