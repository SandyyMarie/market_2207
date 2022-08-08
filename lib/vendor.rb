class Vendor

    attr_reader :name,
                :inventory

    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end

    def stock(item, quantity)
        @inventory.store(item, quantity)
    end

    def check_stock(search_item)
        @inventory[search_item]
    end
end
