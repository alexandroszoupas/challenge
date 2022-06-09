require_relative "app/contollers/batteries_controller"

class Router
  def initialize
    @controller = BatteriesController.new
  end

  def run
    print_welcome
    loop do
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
    end
  end

  def actions
    [
      "Add a battery",
      "List all batteries",
      "Delete a battery",
      "Edit a battery"
    ]
  end

  def print_menu
    puts "\n--\nWhat do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print "> "
  end

  def print_welcome
    puts "-----------------------------"
    puts "Welcome to HackerNewsCopyCat!"
    puts "-----------------------------"
  end
end
