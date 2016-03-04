class CenterSerializer < ActiveModel::Serializer
  attributes :id, :description, :address, :name, :phone_number, :email, :contact_email
end
