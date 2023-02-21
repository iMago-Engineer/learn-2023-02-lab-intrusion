class Question < ApplicationRecord
  has_many :paints
  has_many :trials
end
