class CharacterAttribute < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :_attribute, class_name: "Attribute", foreign_key: "attribute_id"
  belongs_to :character

end
