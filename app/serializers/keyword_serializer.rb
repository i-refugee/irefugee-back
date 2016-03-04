class KeywordSerializer < ActiveModel::Serializer
  attributes :id, :keyword, :created_at, :updated_at
  has_many :center_keywords
  has_many :centers, through: :center_keywords
  belongs_to :need
end
