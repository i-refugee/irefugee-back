class CenterSerializer < ActiveModel::Serializer
	attributes :id, :center_type, :refugees_number, :description, :address, :name, :phone_number, :email, :contact_email, :created_at, :updated_at, :latitude, :longitude
	has_many :center_keywords
	has_many :statuses
	has_many :center_needs 
end
