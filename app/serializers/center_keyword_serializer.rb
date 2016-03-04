class CenterKeywordSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at
  belongs_to :center
  belongs_to :keyword
end
