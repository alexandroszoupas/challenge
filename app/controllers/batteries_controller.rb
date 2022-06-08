class BatteriesController
  require_relative "../views/view"
  require_relative "../models/battery"
  require_relative "../repositories/battery_repository"

  def initialize(battery_repository)
    @battery_repository = battery_repository
    @view = View.new
  end

  def list
    display
  end

  def display
    batteries = @battery_repository.all
    @view.display(batteries)
  end

  def add
    name = @view.ask_user_for_battery_name
    brand = @view.ask_user_for_battery_brand
    voltage = @view.ask_user_for_battery_voltage
    life_cycle = @view.ask_user_for_life_cycle
    battery = Battery.new(name: name, brand: brand, voltage: voltage, life_cycle: life_cycle)
    @battery_repository.create(battery)
  end

  def edit_battery
    id = @view.ask_user_for_battery_index_to_edit
    name = @view.ask_user_for_battery_name
    brand = @view.ask_user_for_battery_brand
    voltage = @view.ask_user_for_battery_voltage
    life_cycle = @view.ask_user_for_life_cycle
    @battery_repository.edit(id, name, brand, voltage, life_cycle)
  end

  def destroy_battery
    id = @view.ask_user_for_battery_index_to_destroy
    @battery_repository.delete_battery(id)
  end
end
