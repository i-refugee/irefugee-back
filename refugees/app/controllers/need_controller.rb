class NeedController < ApplicationController
	before_action :authenticate_with_token_admin!, only: [:create, :destroy, :update]
	


	def index
		need=Need.all
		render json:need
	end

	def show
		need=Need.find_by(id: params[:need_id])
		render json:need
	end

	def create
		need=Need.new(name: params[:name])
		if need.save
       	 	render json: need, status: 201
      	else
        	render json: need.errors, status: 422
        end
    end

   def update
   		need=Need.find_by(id: params[:need_id]).update(name: params[:name])
   		render_updated_resource need
		else
			saving_error @need
		end


    def destroy
    	need=Need.find_by(id: params[:need_id])
    	need.destroy
    	head 204
    end
end
