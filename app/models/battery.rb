class Battery < ActiveRecord::Base

  validates :size, presence: true
  validates :brand, presence: true
  validates :voltage, presence: true
  validates :life_cycle, presence: true
  validates :count, presence: true
end
