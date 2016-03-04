class NeedSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
  has_many :center_needs
  has_many :centers, through: :center_needs
  has_many :keywords
end
