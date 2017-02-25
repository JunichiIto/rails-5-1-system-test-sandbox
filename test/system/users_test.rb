require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = User.create!(name: '伊藤淳一')
  end

  test "yubinbango.js" do
    visit edit_user_path(@user)

    assert has_field?('Name', with: '伊藤淳一')

    fill_in 'Postal code', with: '677-0056'
    assert has_field?('Address', with: '兵庫県西脇市板波町')

    click_button 'Update User'

    assert has_content?('User was successfully updated.')
    assert has_content?('伊藤淳一')
    assert has_content?('677-0056')
    assert has_content?('兵庫県西脇市板波町')
  end
end
