class CarForm < ApplicationRecord
  enum vehicle_type: { sedan: 0, coupe: 1, suv: 2, truck: 3 }
end
