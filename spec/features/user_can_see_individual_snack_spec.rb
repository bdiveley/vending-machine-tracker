require 'rails_helper'

describe "When a user visits the snack show page" do
  it "they see a list of their snacks and prices" do
    sam = Owner.create(name: "Sam's Snacks")
    machine = Machine.create(location: "Dons Mixed Drinks", owner: sam)
    machine_2 = Machine.create(location: "Turing Basement", owner: sam)
    snack = machine.snacks.create(name: "Reeses", price: 1.00)
    machine_2.snacks << snack
    machine.snacks.create(name: "Snickers", price: 3.00)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
    expect(page).to have_content(machine.location)
    expect(page).to have_content(machine_2.location)
    expect(page).to have_content("#{machine.location} Average Snack Price: $2.0")
    expect(page).to have_content("#{machine.location} Snack Count: 2")
    expect(page).to have_content("#{machine_2.location} Average Snack Price: $1.0")
    expect(page).to have_content("#{machine_2.location} Snack Count: 1")
  end
end
