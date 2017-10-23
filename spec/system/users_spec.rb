require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = User.create!(name: 'いとう')
  end

  it 'completes yubinbango automatically', js: true do
    # User編集画面を開く
    visit edit_user_path(@user)

    # Nameに"いとう"が入力されていることを検証する
    expect(page).to have_field('Name', with: 'いとう')

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

  it 'does not complete yubinbango automatically without JS' do
    # User編集画面を開く
    visit edit_user_path(@user)

    # Nameに"いとう"が入力されていることを検証する
    expect(page).to have_field('Name', with: 'いとう')

    # 郵便番号を入力
    fill_in 'Postal code', with: '158-0083'
    # 住所が自動入力されていないことを検証する
    expect(page).to_not have_content '東京都世田谷区奥沢'

    # 更新実行
    click_button 'Update User'

    # 正しく更新されていること（＝画面の表示が正しいこと）を検証する
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'いとう'
    expect(page).to have_content '158-0083'
    expect(page).to_not have_content '東京都世田谷区奥沢'
  end
end