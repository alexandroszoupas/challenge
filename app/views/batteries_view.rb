class BatteriesView
  def display(batteries)
    batteries.each do |battery|
      if battery.deleted.nil?
        puts "index: #{battery.id} | size: #{battery.size}| brand: #{battery.brand}| count:#{battery.count} | voltage: #{battery.voltage} V | life cycle: #{battery.life_cycle} charges"
      else
        puts "index: #{battery.id} | size: #{battery.size}| brand: #{battery.brand}| count:#{battery.count} | voltage: #{battery.voltage} V | life cycle: #{battery.life_cycle} charges | deleted: #{battery.deleted} | reason for deletion: #{battery.deletion_comment}"
      end
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
    puts 'What is the reason to delete this battery size?'
    reason = gets.chomp
    array << index
    array << reason
    array
  end

  def find_by_filter(attribute)
    puts "What is the battery #{attribute}?"
    print '>'
    gets.chomp.upcase
  end
end
