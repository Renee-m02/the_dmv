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
        xit 'sorts colorado info into correct key value pairs' do
            co_facilities = @facility_catalog.catalog_facilities(@co_dmv_office_locations)
            expect(co_facilities[0]).to be_an_instance_of(Facility)
            expect(co_facilities).to be_a(Array)
        end
        it 'sorts info for new york facilities into key value pairs' do
            ny_facilities = @facility_catalog.catalog_facilities(@new_york_facilities)
            expect(ny_facilities).to be_a(Array)
            ny_facilities.each do |facility|
                expect(facility).to be_an_instance_of(Facility)
                expect(facility.name).to be_a(String)
                expect(facility.address).not_to be(nil)
                expect(facility.phone).not_to be(true)
            end
        end
        it 'sorts info for missouri facilities into key value pairs' do
            mo_facilities = @facility_catalog.catalog_facilities(@missouri_facilities)
            expect(mo_facilities).to be_a(Array)
            mo_facilities.each do |facility|
                expect(facility).to be_an_instance_of(Facility)
                expect(facility.name).to be_a(String)
                expect(facility.address).not_to be(nil)
                expect(facility.phone).not_to be(true)
            end
        end
    end

end