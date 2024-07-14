require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
        @facility_catalog = FacilityCatalog.new
    end
    
    describe '#initialize' do
        it 'initializes a FacilityCatalog class' do
            expect(@facility_catalog).to be_an_instance_of(FacilityCatalog)
        end
    end

    describe '#create_vehicle' do
        it 'sorts colorado info into correct key value pairs' do
            co_facilities = @facility_catalog.catalog_facilities(@co_dmv_office_locations)
            expect(co_facilities[0]).to be_an_instance_of(Facility)
            expect(co_facilities[4]).to be_an_instance_of(Facility)
            expect(co_facilities[0].name).to eq("DMV Tremont Branch")
            expect(co_facilities[4].phone).to eq("(720) 865-4600")
            expect(co_facilities[2].address).to eq("3698 W. 44th Avenue")
        end
        it 'sorts info from others states into key value pairs' do
            ny_facilities = @facility_catalog.catalog_facilities(@new_york_facilities)
            expect(ny_facilities[0]).to be_an_instance_of(Facility)
            # require 'pry'; binding.pry
            expect(ny_facilities[0].name).to eq("HUNTINGTON")
            expect(ny_facilities[7].phone).to eq("7184774820")
            expect(ny_facilities[3].address).to eq("855 CENTRAL AVENUE")
        end
    end

end
