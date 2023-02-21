class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :answer, :difficulty, :nickname
  has_many :paints
end
