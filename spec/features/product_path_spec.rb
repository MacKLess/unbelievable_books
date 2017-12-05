require "rails_helper"

describe "the product management path" do
  before do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "does not allow users to add new products" do
    visit new_product_path
    expect(page).to have_content("You aren't authorized to do that.")
    expect(page).to have_no_content("Add a Book")
  end

  it "allows an admin to add new products" do
    @user.update(admin: true)
    visit new_product_path
    fill_in "Name", with: "Carbonite Underpants"
    fill_in "Author", with: "Uncle Tightbottom"
    fill_in "Description", with: "An exploration in alternative menswear."
    fill_in "Price", with: 12
    fill_in "Quantity", with: 20
    click_button "Save"
    expect(page).to have_content("Carbonite Underpants")
  end

  it "displays errors if product cannot be created" do
    @user.update(admin: true)
    visit new_product_path
    click_button "Save"
    expect(page).to have_content("Something went wrong")
  end

  it "allows an admin to edit products" do
    @user.update(admin: true)
    book = FactoryBot.create(:product)
    visit edit_product_path(book)
    fill_in "Name", with: "A book of BEES!"
    click_button "Save"
    expect(page).to have_content("A book of BEES!")
  end

  it "displays errors if product cannot be updated" do
    @user.update(admin: true)
    book = FactoryBot.create(:product)
    visit edit_product_path(book)
    fill_in "Name", with: ""
    click_button "Save"
    expect(page).to have_content("Something went wrong")
  end

  it "allows admin to delete products" do
    @user.update(admin: true)
    book = FactoryBot.create(:product)
    visit product_path(book)
    click_on "Delete"
    expect(page).to have_no_content("You and Your Bantha")
  end
end
