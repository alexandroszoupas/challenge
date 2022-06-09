require_relative "app/contollers/batteries_controller"

class Router
  def initialize
    @controller = BatteriesController.new
    @running = true
  end

  def run
    while @running
      print_welcome
      print_menu
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.create
    when 2 then @controller.index
    when 3 then @controller.destroy
    when 4 then @controller.edit
    when 5 then stop
    end
  end

  def stop
    @running = false
  end

  def actions
    [
      "Add a battery",
      "List all batteries",
      "Delete a battery",
      "Edit a battery",
      "Exit the app"
    ]
  end

  def print_menu
    puts "What do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print '>'
  end

  def print_welcome
    puts "---------------------"
    puts "--Battery Inventory--"
    puts "---------------------"
  end
end
