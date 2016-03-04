class TokenSerializer < ActiveModel::Serializer
  attributes :id, :auth_token, :created_at, :updated_at
  belongs_to :center
  belongs_to :admin
end
