class BatteriesView
  def display(batteries)
    batteries.each do |battery|
      # if battery.deleted == false
      puts "index: #{battery.id} | name: #{battery.name}| brand: #{battery.brand}| voltage: #{battery.voltage} V | life_cycle: #{battery.life_cycle} hrs | deleted: #{battery.deleted}"
      # end
    end
  end

  def battery(attribute)
    puts "#{attribute.capitalize}?"
    print '>'
    gets.chomp
  end

  def find_index
    puts 'What is the index number?'
    gets.chomp.to_i
  end
end
