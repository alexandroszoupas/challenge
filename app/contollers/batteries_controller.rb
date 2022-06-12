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
    count = @batteries_view.battery(:count)
    Battery.create(name: name.to_s, brand: brand.to_s, voltage: voltage, life_cycle: life_cycle.to_i, count: count.to_i)
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

  def list_by_type
    name = @batteries_view.find_by_filter(:name)
    batteries = Battery.where(name: name)
    @batteries_view.display(batteries)
  end

  def list_by_brand
    brand = @batteries_view.find_by_filter(:brand)
    batteries = Battery.where(brand: brand)
    @batteries_view.display(batteries)
  end

  def destroy
    id = @batteries_view.delete_battery[0]
    battery = Battery.find(id)
    battery.deleted = 1
    deleted_comment = @batteries_view.delete_battery[1]
    battery.deletion_comment = deleted_comment
    battery.save
  end

  def list_deleted
    batteries = Battery.where(deleted: 1)
    @batteries_view.display(batteries)
  end

  def recover
    list_deleted
    id = @batteries_view.find_index
    battery = Battery.find(id)
    battery.deleted = 0
    battery.save
  end

  def remove
    id = @batteries_view.find_index
    battery = Battery.find(id)
    battery.count = 0
    battery.save
  end
end
