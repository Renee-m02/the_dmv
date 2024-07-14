require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations 
        @factory = VehicleFactory.new
    end
    
    describe '#initialize' do
        it 'initializes a vehicle class' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#create_vehicle' do
        it 'sorts wa info into correct key value pairs' do
            wa_data = @factory.create_vehicles(@wa_ev_registrations)
            expect(wa_data[0]).to be_an_instance_of(Vehicle)
            expect(wa_data[6]).to be_an_instance_of(Vehicle)
        end
    end

end
