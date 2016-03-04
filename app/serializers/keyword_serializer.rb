class KeywordSerializer < ActiveModel::Serializer
  attributes :id, :keyword, :created_at, :updated_at

  belongs_to :need
end
