require 'rails_helper'

RSpec.describe "Comments", type: :system do


  scenario "ログインユーザはポストにコメントをする" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    

    expect {
      click_link "詳しく見る", match: :first
      fill_in "コメントを入力", with: "コメント"
      click_button "コメントする"

      expect(page).to have_content "コメントしました"
      expect(page).to have_content "コメント"
      expect(page).to have_content "このコメントを削除する"
    }.to change(user.comments, :count).by(1)

  end

  scenario "ログインユーザはコメントを削除できる" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    
    click_link "詳しく見る", match: :first
    fill_in "コメントを入力", with: "コメント"
    click_button "コメントする"

    expect {
      click_link "このコメントを削除する"
      expect(page).to have_content "コメントを削除しました"
      expect(page).to have_content "投稿詳細"
      expect(page).to have_content "#{post.found_animal}"
    }.to change(user.comments, :count).by(-1)
  end

end
