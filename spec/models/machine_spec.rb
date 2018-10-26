require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many(:machine_snacks) }
    it { should have_many(:snacks).through(:machine_snacks) }
  end
  it "should calulate average price of all snacks" do
    sam = Owner.create(name: "Sam's Snacks")
    machine = Machine.create(location: "Dons Mixed Drinks", owner: sam)
    machine.snacks.create(name: "Reeses", price: 9.00)
    machine.snacks.create(name: "Snickers", price: 3.00)

    expect(machine.average_price).to eq(6.0)
  end
end
