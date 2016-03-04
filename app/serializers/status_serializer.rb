class StatusSerializer < ActiveModel::Serializer
  attributes :id, :context, :created_at, :updated_at
  belongs_to :center
end