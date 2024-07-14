class VehicleFactory
   
    attr_reader :factory

    def initialize

    end

    def create_vehicles(dmv_registrations)
        dmv_registrations.map do |registration|
            vehicle_data = {}
            vehicle_data[:vin] = registration[:vin_1_10]
            vehicle_data[:year] = registration[:model_year]
            vehicle_data[:make] = registration[:make]
            vehicle_data[:model_year] = registration[:model]
            vehicle_data[:engine] = :ev
            Vehicle.new(vehicle_data)
        end
    end

end

