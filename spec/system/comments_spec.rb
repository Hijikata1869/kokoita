require 'rails_helper'

RSpec.describe "Comments", type: :system do

  scenario "ユーザはポストにコメントをする" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    comment = FactoryBot.create(:comment)

    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect {
      click_link "詳しく見る", match: :first
      fill_in "コメントを入力", with: "可愛いですね！"
      click_button "コメントする"

      expect(page).to have_content "コメントしました"
      expect(page).to have_content "可愛いですね！"
      expect(page).to have_content "このコメントを削除する"
      save_and_open_page
    }.to change(user.comments, :count).by(1)

  end

end