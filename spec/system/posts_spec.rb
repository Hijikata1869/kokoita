require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  scenario 'ユーザは新しいポストを作成する' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit root_path
    click_link 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    expect do
      click_link '投稿する'
      fill_in 'found_animal', with: post.found_animal
      select '動物', from: 'category_id', match: :first
      select '北海道', from: 'prefecture_id', match: :first
      select '2019', from: '[found_date(1i)]'
      select '6', from: '[found_date(2i)]'
      click_button '投稿する'

      expect(page).to have_content '投稿しました'
      expect(page).to have_content user.nickname
      expect(page).to have_content post.found_animal
    end.to change(user.posts, :count).by(1)
  end

  scenario 'ユーザはポストを削除できる' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit root_path
    click_link 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    click_link '投稿する'
    fill_in 'found_animal', with: post.found_animal
    select '動物', from: 'category_id', match: :first
    select '北海道', from: 'prefecture_id', match: :first
    select '2019', from: '[found_date(1i)]'
    select '6', from: '[found_date(2i)]'
    click_button '投稿する'

    expect do
      click_link '削除する'

      expect(page).to have_content '記事を一件削除しました'
      expect(page).to have_content user.nickname
      expect(page).to have_content "#{user.nickname}の投稿"
    end.to change(user.posts, :count).by(-1)
  end
end
