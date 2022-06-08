class Router
  def initialize(attributes = {})
    @batteries_controller = attributes[:batteries_controller]
    @running = true
  end

  def run
    puts '--Battery Inventory App--'

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @batteries_controller.add
    when 2 then @batteries_controller.list
    when 3 then @batteries_controller.destroy_battery
    when 4 then @batteries_controller.edit_battery
    when 5 then stop
    else
      puts 'Please press 1 to 5'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1 - Add battery to inventory'
    puts '2 - List all batteries'
    puts '3 - Delete a battery'
    puts '4 - Edit a battery'
    puts '5 - Exit application'
  end
end
