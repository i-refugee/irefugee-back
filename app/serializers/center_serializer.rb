class CenterSerializer < ActiveModel::Serializer
	attributes :id, :center_type, :slug, :image_url, :refugees_number, :description, :address, :name, :phone_number, :email, :contact_email, :created_at, :updated_at, :latitude, :longitude
=begin
	has_many :center_keywords
	has_many :statuses
	has_many :center_needs
	has_many :keywords, through: :center_keywords
=end

	has_many :important_needs

# keep this form of relations in order to only include links and not data
# in the json when AMS hits a new stable branch

	has_many :center_keywords do
	  link :related do
    	href center_center_keywords_url(object)
	  end
	  include_data false
	end

	has_many :keywords do
	  link :related do
    	href center_keywords_url(object)
	  end
	  include_data false
	end

	has_many :center_needs do
	  link :related do
    	href center_center_needs_url(object)
	  end
	  include_data false
	end

	has_many :statuses do
	  link :related do
    	href center_statuses_url(object)
	  end
	  include_data false
	end

	def image_url
	#	if object.image_identifier
	#		return "https://cdn.irefugee.gr/" + object.image_identifier
	#	else
			return nil
	#	end
	end 
end
