class PaintSerializer < ActiveModel::Serializer
  attributes :id, :target, :painted_count
end
