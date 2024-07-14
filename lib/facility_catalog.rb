class FacilityCatalog
   
    attr_reader :facility_catalog

    def initialize

    end

    def catalog_facilities(dmv_offices)
        dmv_offices.map do |office|
            office_info = {}
            office_info[:name] = office[:dmv_office]
            office_info[:address] = office[:address_li]
            office_info[:phone] = office[:phone]
            Facility.new(office_info)
        end
    end

end
