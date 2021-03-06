require 'rails_helper'

describe "a user can delete dogs from the cart" do
  before(:each) do
    @category = create(:category)
    @dog = create(:dog, category_ids: @category.id)
  end
  it "removes the dog" do
    visit dogs_path

    click_button "Add Dog"

    click_link "Cart"
    expect(current_path).to eq(cart_path)

    click_button "Remove Dog"

    expect(page).to have_content("Successfully removed #{@dog.name} from your cart.")

    expect(page).to_not have_content("#{@dog.breed}")
  end
end
