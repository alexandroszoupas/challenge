require_relative "../views/batteries_view"
require_relative "../models/battery"

class BatteriesController
  def initialize
    @batteries_view = BatteriesView.new
  end

  def index
    batteries = Battery.all
    @batteries_view.display(batteries)
  end

  def create
    name = @batteries_view.battery(:name)
    brand = @batteries_view.battery(:brand)
    voltage = @batteries_view.battery(:voltage)
    life_cycle = @batteries_view.battery(:life_cycle)
    Battery.create(name: name.to_s, brand: brand.to_s, voltage: voltage.to_i, life_cycle: life_cycle.to_i)
  end

  def edit
    index
    id = @batteries_view.find_index
    name = @batteries_view.battery(:name)
    brand = @batteries_view.battery(:brand)
    voltage = @batteries_view.battery(:voltage)
    life_cycle = @batteries_view.battery(:life_cycle)
    battery = Battery.find(id)
    assign(battery, name, brand, voltage, life_cycle)
  end

  def assign(battery, name, brand, voltage, life_cycle)
    battery.name = name
    battery.brand = brand
    battery.voltage = voltage
    battery.life_cycle = life_cycle
    battery.save
  end

  def destroy
    id = @batteries_view.find_index
    battery = Battery.find(id)
    battery.deleted = 1
    battery.save
  end
end
