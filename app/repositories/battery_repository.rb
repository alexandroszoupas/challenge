class BatteryRepository
  require "csv"

  def initialize(csv_file_path)
    @batteries = []
    @next_id = 1
    @csv_file = csv_file_path
    load_csv if File.exist?(@csv_file)
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name].to_s
      row[:brand] = row[:brand].to_s
      row[:voltage] = row[:voltage].to_i
      row[:life_cycle] = row[:life_cycle].to_i
      @batteries << Battery.new(row)
      @next_id = row[:id]
    end
    @next_id += 1
  end

  def create(battery)
    battery.id = @next_id
    @next_id += 1
    @batteries << battery
    save_to_csv
  end

  def all
    @batteries
  end

  def find(id)
    @batteries.each do |battery|
      return battery if battery.id == id
    end
  end

  def delete_battery(id)
    @batteries.delete_at(id)
    save_to_csv
  end

  def delete_all_batteries
    @batteries.clear
    save_to_csv
  end

  def edit(id, name, brand, voltage, life_cycle)
    @batteries.each do |battery|
      if battery.id == id
        battery.name = name
        battery.brand = brand
        battery.voltage = voltage
        battery.life_cycle = life_cycle
        @batteries << battery
        save_to_csv
      end
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id", "name", "brand", "voltage", "life_cycle"]
      @batteries.each do |battery|
        csv << [battery.id, battery.name, battery.brand, battery.voltage, battery.life_cycle]
      end
    end
  end
end
