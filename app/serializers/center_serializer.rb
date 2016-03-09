class CenterSerializer < ActiveModel::Serializer
	attributes :id, :center_type, :slug, :image_url, :refugees_number, :description, :address, :name, :phone_number, :email, :contact_email, :created_at, :updated_at, :latitude, :longitude
	has_many :center_keywords
	has_many :statuses
	has_many :center_needs
	has_many :keywords, through: :center_keywords
	has_many :important_needs
	
	def image_url
		if object.image_identifier
			return "http://localhost:8123/" + object.image_identifier
		else
			return nil
		end
	end 
end
