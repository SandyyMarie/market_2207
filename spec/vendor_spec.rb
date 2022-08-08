require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
    before :each do
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
        @vendor = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Ba-Nom-a-Nom")
        @vendor3 = Vendor.new("Palisade Peach Shack")
    end

    it 'exists' do
        expect(@vendor).to be_a(Vendor)
    end

    it 'can return basic vendor attributes' do
        expect(@vendor.name).to eq("Rocky Mountain Fresh")
        expect(@vendor.inventory).to eq({})
        expect(@vendor.check_stock(@item1)).to eq(0)
    end

    it 'can stock items' do
        @vendor.stock(@item1, 30)
        expect(@vendor.inventory).to eq(@item1 => 30)
        expect(@vendor.check_stock(@item1)).to eq(30)
    end

    it 'can return the potential revenue for a client' do
        @vendor.stock(@item1, 35)
        @vendor.stock(@item2, 7)
        @vendor2.stock(@item4, 50)
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65)
        expect(@vendor.potential_revenue).to eq(29.75)
        expect(@vendor2.potential_revenue).to eq(345.00)
        expect(@vendor3.potential_revenue).to eq(48.75)
    end
end