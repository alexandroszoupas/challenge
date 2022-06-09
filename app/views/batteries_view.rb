class BatteriesView
  def display(batteries)
    batteries.each do |battery|
      puts "index: #{battery.id}, name: #{battery.name}, brand: #{battery.brand}, voltage: #{battery.voltage}"
    end
  end

  def battery_name
    puts "gimme name"
    return gets.chomp
  end

  def battery_brand
    puts "gimme brand"
    return gets.chomp
  end

  def battery_voltage
    puts "gimme voltage"
    return gets.chomp.to_i
  end

  def life_cycle
    puts "gimme life cycle"
    return gets.chomp.to_i
  end

  def update_battery_name
    puts "gimme updated name"
    return gets.chomp
  end

  def update_battery_brand
    puts "gimme updated brand"
    return gets.chomp
  end

  def update_battery_voltage
    puts "gimme updated voltage"
    return gets.chomp
  end

  def update_battery_life_cycle
    puts "gimme updated cycle"
    return gets.chomp
  end

  def find_index
    puts "gimme battery index number"
    return gets.chomp.to_i
  end
end
# def destroy_all
#   puts "Confirm if you want to destroy all posts by typing 1. This action cannot be undone"
#   return gets.chomp.to_i
# end
