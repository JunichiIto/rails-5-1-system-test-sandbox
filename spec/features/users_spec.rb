require 'rails_helper'

RSpec.feature 'Users', type: :feature, js: true do
  background do
    # テストデータの作成
    @user = User.create!(name: 'いとう')
  end

  scenario do
    # User編集画面を開く
    visit edit_user_path(@user)

    # Nameに"いとう"が入力されていることを検証する
    expect(page).to have_field 'Name', with: 'いとう'

    # 郵便番号を入力
    fill_in 'Postal code', with: '158-0083'
    # 住所が自動入力されたことを検証する
    expect(page).to have_field 'Address', with: '東京都世田谷区奥沢'

    # 更新実行
    click_button 'Update User'

    # 正しく更新されていること（＝画面の表示が正しいこと）を検証する
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'いとう'
    expect(page).to have_content '158-0083'
    expect(page).to have_content '東京都世田谷区奥沢'
  end
end
