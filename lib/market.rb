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

    def total_inventory
        total_inv = Hash.new({:quantity => 0, :vendors => []})

        @vendors.each do |vendor|
            vendor.inventory.each do |item|
                total_inv[item[0]] = {:quantity => item[1], :vendors => vendor}
            end
        end
        total_inv
    end

    def overstocked_items
        overstocked = []
        total_inventory.each do |item|
            if (item[1][:quantity] > 50) && (vendor_that_sell(item[0]).count > 1)
                overstocked << item[0]
            end
        end
        overstocked
    end

    def sorted_item_list
        alphabetical_items = []
        total_inventory.keys.each do |item|
            alphabetical_items << item.name
        end
        alphabetical_items.uniq.sort
    end
end
