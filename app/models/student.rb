class Student < ApplicationRecord

  validates :name, presence: { message: "can't be blank" }
  validates :subject, presence: { message: "can't be blank" } 
  validates :marks, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end

