class BatteriesView
  def display(batteries)
    batteries.each do |battery|
      puts "index: #{battery.id} | name: #{battery.name}| brand: #{battery.brand}| voltage: #{battery.voltage} V | life_cycle: #{battery.life_cycle} hrs | deleted: #{battery.deleted} | count:#{battery.count}"
    end
  end

  def battery(attribute)
    puts "What is the battery #{attribute}?"
    print '>'
    gets.chomp.upcase
  end

  def find_index
    puts 'What is the index number?'
    gets.chomp.to_i
  end

  def delete_battery
    array = []
    index = find_index
    puts 'What is the reason to delete this battery type?'
    reason = gets.chomp
    array << index
    array << reason
    array
  end

  def find_by_filter(attribute)
    puts "What is the battery #{attribute}?"
    print '>'
    gets.chomp
  end
end
