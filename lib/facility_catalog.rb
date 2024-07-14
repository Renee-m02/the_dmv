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

    # def catalog_facilities(dmv_offices)
    #     dmv_offices.map do |office|
    #         office_info = {}
    #         if office[:dmv_office] == true
    #             office_info[:name] = office[:dmv_office]
    #         elsif office[:office_name] == true
    #             office_info[:name] = office[:office_name]
    #         elsif office[:name] == true
    #             office_info[:name] = office[:name]
    #         end
    #         if office[:address_li] == true
    #             office_info[:address] = office[:address_li]
    #         elsif office[:street_address_line_1] == true
    #             office_info[:address] = office[:street_address_line_1]
    #         elsif office[:address1] == true
    #             office_info[:address] = office[:address1]
    #         end
    #         if office[:phone] == true
    #             office_info[:phone] = office[:phone]
    #         elsif office[:public_phone_number] == true
    #             office_info[:phone] = office[:public_phone_number]
    #         end
    #         Facility.new(office_info)
    #     end
    # end

end
