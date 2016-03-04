class NewsfeedSerializer < ActiveModel::Serializer
  attributes :id, :content, :center_id, :model, :model_id, :created_at, :updated_at
  belongs_to :center
end
