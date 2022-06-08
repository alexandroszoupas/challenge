class View
  attr_reader :battery

  def display(batteries)
    batteries.each_with_index do |battery, index|
      puts "#{index + 1}, #{battery.name}, #{battery.brand}, #{battery.voltage}, #{battery.life_cycle}"
    end
  end

  def ask_user_for_battery_name
    puts "What is the name of the battery?"
    return gets.chomp
  end

  def ask_user_for_battery_brand
    puts "What is the brand of the battery?"
    return gets.chomp
  end

  def ask_user_for_battery_voltage
    puts "What is the voltage of the battery?"
    return gets.chomp.to_i
  end

  def ask_user_for_life_cycle
    puts "What is the life cycle of the battery?"
    return gets.chomp.to_i
  end

  def ask_user_for_battery_index_to_edit
    puts "What is the battery index that you want to edit"
    return gets.chomp.to_i - 1
  end

  def ask_user_for_battery_index_to_destroy
    puts "What is the battery index that you want to destroy"
    return gets.chomp.to_i - 1
  end
end

  # def display_orders(lists)
  #   lists.each do |list|
  #     puts "#{list.meal}, #{list.employee}, #{list.customer.name}"
  #   end
  # end

  # def display_rings(rings)
  #   rings.each do |customer|
  #     puts "#{ring.name}, #{ring.id}, #{ring.address}"
  #   end
  # end



  # def ask_user_for_ring_id_to_destroy
  #   puts "What is the ring id that you want to destroy"
  #   return gets.chomp.to_i
  # end

  # def destroy_all_rings
  #   puts "Confirm if you want to delete all rings by typing 1. This action cannot be undone"
  #   return gets.chomp.to_i
  # end

  # def ask_user_for_ring_index
  #   puts "Gimme meal index"
  #   return gets.chomp.to_i
  # end
