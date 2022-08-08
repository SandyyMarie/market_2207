class Market

    attr_reader :name,
                :vendors

    def initialize(name)
        @name = name
        @vendors = []
    end

    def add_vendor(vendor)
        vendors << vendor
    end

    def vendor_names
        names = []
        @vendors.each do |vendor|
            names << vendor.name
        end
        names
    end

    def vendor_that_sell(search_item)
        sells_item = []
        @vendors.each do |vendor|
            vendor.inventory.each do |item|
                if search_item == item[0]
                    sells_item << vendor
                end
            end
        end
        sells_item
    end
end
