module Authorizable

	def find_and_authorize_resource type
		if type == "center"
			@center = Center.find_by(id: params[:id])
			authorize(@center)
		elsif type == "center_invoked"
#			puts("SDAFSFDAFDSAFSDA")
#			puts(params[:center_id])
			@center = Center.find_by(id: params[:center_id])
			authorize(@center)
		end			
	end

	def authorize center
		puts("QRWRWEQREWQ") 
		puts(center.id)
		puts(current_center.id)
		puts("FSDAFSD")
		if center
	      unless current_center.id == center.id
	        render_not_authorized
	      end
	    else
	      resource_does_not_exist
	    end
	end
	
end