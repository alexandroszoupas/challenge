require_relative '../views/batteries_view'
require_relative '../models/battery'
require 'date'

class BatteriesController
  def initialize
    @batteries_view = BatteriesView.new
  end

  def index
    batteries = Battery.all.where(deleted: nil)
    @batteries_view.display(batteries)
  end

  def create
    size = @batteries_view.battery(:size)
    brand = @batteries_view.battery(:brand)
    voltage = @batteries_view.battery(:voltage)
    life_cycle = @batteries_view.battery(:life_cycle)
    count = @batteries_view.battery(:count)
    Battery.create(size: size.to_s, brand: brand.to_s, voltage: voltage, life_cycle: life_cycle.to_i, count: count.to_i)
  end

  def edit
    index
    id = @batteries_view.find_index
    size = @batteries_view.battery(:size)
    brand = @batteries_view.battery(:brand)
    voltage = @batteries_view.battery(:voltage)
    life_cycle = @batteries_view.battery(:life_cycle)
    battery = Battery.find(id)
    assign(battery, size, brand, voltage, life_cycle)
  end

  def assign(battery, size, brand, voltage, life_cycle)
    battery.size = size
    battery.brand = brand
    battery.voltage = voltage
    battery.life_cycle = life_cycle
    battery.save
  end

  def list_by_size
    size = @batteries_view.find_by_filter(:size)
    batteries = Battery.where(size: size)
    @batteries_view.display(batteries)
  end

  def list_by_brand
    brand = @batteries_view.find_by_filter(:brand)
    batteries = Battery.where(brand: brand)
    @batteries_view.display(batteries)
  end

  def destroy
    array = @batteries_view.delete_battery
    battery = Battery.find(array[0])
    battery.deleted = Time.now.getutc
    deleted_comment = array[1]
    battery.deletion_comment = deleted_comment
    battery.save
  end

  def list_deleted
    batteries = Battery.where.not(deleted: nil)
    @batteries_view.display(batteries)
  end

  def recover
    list_deleted
    id = @batteries_view.find_index
    battery = Battery.find(id)
    battery.deleted = nil
    battery.deletion_comment = nil
    battery.save
  end

  def remove
    id = @batteries_view.find_index
    battery = Battery.find(id)
    battery.count = 0
    battery.save
  end
end
