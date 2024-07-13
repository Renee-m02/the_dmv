class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    
    if @services.include?('Vehicle Registration') == true
      @registered_vehicles << vehicle
      vehicle.set_registration_date
      vehicle.set_plate_type

      if vehicle.antique? == true
        @collected_fees += 25
      elsif vehicle.electric_vehicle? == true
        @collected_fees += 200
      else
        @collected_fees += 100
      end
    end

    if @registered_vehicles.empty? == true
      return nil
    elsif @registered_vehicles.empty? == false
      return @registered_vehicles
    end
    
  end

end
