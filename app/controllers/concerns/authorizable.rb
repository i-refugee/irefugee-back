module Authorizable

	def find_and_authorize_resource type
		if type == "center"
			@center = Center.find_by(id: params[:id])
			authorize(@center)
		elsif type == "center_invoked"
			@center = Center.find_by(id: params[:center_id])
			authorize(@center)
		end			
	end

	def authorize center
		if center 
	      unless current_center.id == center.id
	        render_not_authorized
	      end
	    else
	      resource_does_not_exist
	    end
	end
	
end