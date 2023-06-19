class Tag < ApplicationRecord

  belongs_to :compaign
  has_many :subtags, class_name: "Tag", foreign_key: "supertag_id"
  belongs_to :supertag, class_name: "Tag", optional: true
  
end
