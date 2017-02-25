require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    # テストデータの作成
    @user = User.create!(name: 'いとう')
  end

  test "yubinbango.js" do
    # User編集画面を開く
    visit edit_user_path(@user)

    # Nameに"いとう"が入力されていることを検証する
    assert has_field?('Name', with: 'いとう')

    # 郵便番号を入力
    fill_in 'Postal code', with: '158-0083'
    # 住所が自動入力されたことを検証する
    assert has_field?('Address', with: '東京都世田谷区奥沢')

    # 更新実行
    click_button 'Update User'

    # 正しく更新されていること（＝画面の表示が正しいこと）を検証する
    assert_text 'User was successfully updated.'
    assert_text 'いとう'
    assert_text '158-0083'
    assert_text '東京都世田谷区奥沢'
  end
end
