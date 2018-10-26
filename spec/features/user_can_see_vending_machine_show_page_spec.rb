require 'rails_helper'

describe "When a user visits the vending machine show page" do
  it "they see a list of their snacks and prices" do
    sam = Owner.create(name: "Sam's Snacks")
    machine = Machine.create(location: "Dons Mixed Drinks", owner: sam)
    machine.snacks.create(name: "Reeses", price: 2.00)
    machine.snacks.create(name: "Snickers", price: 3.00)

    visit machine_path(machine)

    expect(page).to have_content(machine.snacks.first.name)
    expect(page).to have_content(machine.snacks.first.price)
  end
  it "they see an average price for all of the snacks in that machine" do
  sam = Owner.create(name: "Sam's Snacks")
  machine = Machine.create(location: "Dons Mixed Drinks", owner: sam)
  machine.snacks.create(name: "Reeses", price: 9.00)
  machine.snacks.create(name: "Snickers", price: 3.00)

  visit machine_path(machine)

  expect(page).to have_content("Average Price: 6")
  end
end
