class NeedsController < ApplicationController
	before_action :authenticate_with_token_admin!, only: [:create, :destroy, :update]
	
	def index
		need=Need.all
		render json:need
	end

	def show
		need=Need.find_by(id: params[:id])
		unless need
			head 404
		else 
			render json:need
		end
	end

	def create
		need=Need.new(name: params[:name])
		if need.save
			render_created_resource need
      	else
        	saving_error need
        end
    end

   def update
   		need=Need.find_by(id: params[:need_id]).update(name: params[:name])
   		if need.save
   			render_updated_resource need
		else
			saving_error need
		end
	end

    def destroy
    	need=Need.find_by(id: params[:need_id])
    	need.destroy
    	render_successful_destroy
    end
end
