require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  setup do
    @place = places(:one)
  end

  test "visiting the index" do
    visit places_url
    assert_selector "h1", text: "Places"
  end

  test "creating a Place" do
    visit places_url
    click_on "New Place"

    fill_in "City", with: @place.city
    fill_in "Country", with: @place.country
    fill_in "Float", with: @place.float
    fill_in "Latitude", with: @place.latitude
    fill_in "Location", with: @place.location
    fill_in "Longitude", with: @place.longitude
    fill_in "Name", with: @place.name
    fill_in "Place type", with: @place.place_type
    fill_in "State", with: @place.state
    fill_in "String", with: @place.string
    click_on "Create Place"

    assert_text "Place was successfully created"
    click_on "Back"
  end

  test "updating a Place" do
    visit places_url
    click_on "Edit", match: :first

    fill_in "City", with: @place.city
    fill_in "Country", with: @place.country
    fill_in "Float", with: @place.float
    fill_in "Latitude", with: @place.latitude
    fill_in "Location", with: @place.location
    fill_in "Longitude", with: @place.longitude
    fill_in "Name", with: @place.name
    fill_in "Place type", with: @place.place_type
    fill_in "State", with: @place.state
    fill_in "String", with: @place.string
    click_on "Update Place"

    assert_text "Place was successfully updated"
    click_on "Back"
  end

  test "destroying a Place" do
    visit places_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place was successfully destroyed"
  end
end
