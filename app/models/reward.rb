class Reward < ApplicationRecord
    belongs_to :project

    validates :pledge,
      numericality: {only_integer: true, greater_than: 0}

    enum ships: { No_shipping: 0, OnlyCertainCountries: 1, AnywhereInTheWorld: 2}
end
