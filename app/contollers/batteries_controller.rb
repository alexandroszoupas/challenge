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
    name = @batteries_view.battery_name
    brand = @batteries_view.battery_brand
    voltage = @batteries_view.battery_voltage
    life_cycle = @batteries_view.life_cycle
    Battery.create(name: name.to_s, brand: brand.to_s, voltage: voltage.to_i, life_cycle: life_cycle.to_i)
  end

  def edit
    index
    id = @batteries_view.find_index
    name = @batteries_view.update_battery_name
    brand = @batteries_view.update_battery_brand
    voltage = @batteries_view.update_battery_voltage
    life_cycle = @batteries_view.update_battery_life_cycle
    battery = Battery.find(id)
    battery.name = name
    battery.brand = brand
    battery.voltage = voltage
    battery.life_cycle = life_cycle
    battery.save
  end

  def destroy
    index = @batteries_view.find_index
    battery = Battery.find(index)
    battery.destroy
  end
end
# def upvote
#   index
#   id = @posts_view.find_index
#   post = Post.find(id)
#   post.votes += 1
#   post.save
# end

# def destroy_all
#   number = @posts_view.destroy_all
#   Post.destroy_all if number == 1
# end
