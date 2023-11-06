class CarForm < ApplicationRecord
  enum vehicle_type: { sedan: 0, coupe: 1, suv: 2, truck: 3 }
  has_one_attached :attachment
  has_many :quotations
  belongs_to :user
end
