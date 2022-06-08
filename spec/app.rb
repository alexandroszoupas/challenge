require_relative "../app/views/view"
require_relative "../app/models/battery"
require_relative "../app/repositories/battery_repository"
require_relative "../app/controllers/batteries_controller"
require_relative "router"

csv_file_batteries = File.join(__dir__, "../app/repositories/batteries.csv")
battery_repository = BatteryRepository.new(csv_file_batteries)
batteries_controller = BatteriesController.new(battery_repository)

router = Router.new(batteries_controller: batteries_controller)

router.run
