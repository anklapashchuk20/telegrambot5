require "application_system_test_case"

class HellosTest < ApplicationSystemTestCase
  setup do
    @hello = hellos(:one)
  end

  test "visiting the index" do
    visit hellos_url
    assert_selector "h1", text: "Hellos"
  end

  test "should create hello" do
    visit hellos_url
    click_on "New hello"

    click_on "Create Hello"

    assert_text "Hello was successfully created"
    click_on "Back"
  end

  test "should update Hello" do
    visit hello_url(@hello)
    click_on "Edit this hello", match: :first

    click_on "Update Hello"

    assert_text "Hello was successfully updated"
    click_on "Back"
  end

  test "should destroy Hello" do
    visit hello_url(@hello)
    click_on "Destroy this hello", match: :first

    assert_text "Hello was successfully destroyed"
  end
end
