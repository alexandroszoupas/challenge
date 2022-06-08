class Battery
  attr_accessor :name, :brand, :voltage, :life_cycle, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @brand = attributes[:brand]
    @voltage = attributes[:voltage]
    @life_cycle = attributes[:life_cycle]
  end
end
