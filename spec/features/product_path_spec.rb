require "rails_helper"

describe "the product management path" do
  before do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
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
end
