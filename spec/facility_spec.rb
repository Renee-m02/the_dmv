require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register vehicle' do
    it 'has registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
    end

    it 'only registers a vehicle if the facility offers that service' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#collected fees' do
    it 'has collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(125)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#administer_written_test' do
    it 'offers a written test' do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
    end
    it 'changes :written from flase to true when requirements are met' do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
    end
    it 'does not change from false to true when requirements are not met' do
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
    end
  end

  describe '#administer_road_test' do
    it 'offers a road test' do
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
    end
    it 'only gives licenses to registrants that meet reguirements' do
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(@registrant_3)).to eq(false)
    end
  end

  describe '#renew_drivers_license' do
    it 'offers a renewal service' do
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)
      @facility_1.add_service('Renew License')
      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
    end
    it 'does not renew if requirements are not met' do
      @facility_1.add_service('Renew License')
      expect(@facility_1.renew_drivers_license(@registrant_3)).to eq(false)
    end
  end

end
