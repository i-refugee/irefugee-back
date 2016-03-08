class StatusController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:update, :destroy, :create] do |c|
		c.send(:find_and_authorize_resource, "center_invoked")
	end

	def show
		statuses=center.find_by(id:params[:center_id]).statuses.all.order(id: :desc)
		render json:statuses
	end

    def create
		status=@current_center.statuses.new(context: params[:context])
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


    def destroy
    	status=@current_center.statuses.find_by(id: params[:status_id])
    	status.destroy
    	render_successful_destroy
    end



end
