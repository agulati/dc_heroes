class Character < ApplicationRecord
  self.inheritance_column = nil

  has_many :character_attributes
  accepts_nested_attributes_for :character_attributes, allow_destroy: true
end
