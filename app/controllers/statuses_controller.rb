class StatusesController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:update] do |c|
		c.send(:find_and_authorize_resource, "center_invoked")
	end

	def show
		status = Status.find_by(id: params[:id])
		unless status 
			head 404
		else 
			render status			
		end
	end

	def index
		statuses=center.find_by(id:params[:center_id]).statuses.all.order(id: :desc)
		render json:statuses
	end

    def create
    	center = Center.find_by(id: params[:data][:relationships][:center][:data][:id])
    	authorize(center)
		status=Status.new(center_id: center.id, context: params[:data][:attributes][:context])
		if status.save
			render_created_resource status    	
		else
        	saving_error status
        end
    end

   def update
   		status=@current_center.statuses.find_by(id: params[:status_id]).update(context: params[:context])
   		if status.save
   			render_updated_resource status
		else
			saving_error @status
		end
	end


    def destroy
    	status=Status.find_by(id: params[:id])
    	authorize(status.center)
    	status.destroy
    	render_successful_destroy
    end



end
