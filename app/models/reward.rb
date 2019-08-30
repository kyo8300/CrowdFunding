class Reward < ApplicationRecord
    belongs_to :project

    validate :deliverytime_cannot_be_in_the_past
    validates :pledge,
      numericality: {only_integer: true, greater_than: 0}

      validates :limit,
      numericality: {only_integer: true, greater_than_or_equal_to: 0}

    enum ships: { No_shipping: 0, OnlyCertainCountries: 1, AnywhereInTheWorld: 2}

    private
      def deliverytime_cannot_be_in_the_past
        errors.add(:deliverytime, "can't be in the past") if deliverytime < Date.today
      end
end
