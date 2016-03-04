class CenterNeedSerializer < ActiveModel::Serializer
  attributes :id, :description, :importance, :created_at, :updated_at
  belongs_to :need
  belongs_to :center
end
