require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  scenario 'ユーザはいいねができる' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit root_path
    click_link 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    expect do
      click_link '詳しく見る', match: :first
      first(:css, '.like').click

      expect(page).to have_content 'いいね！済み'
      expect(page).to_not have_content 'いいね！する'
    end.to change(post.likes, :count).by(1)
  end

  scenario 'ユーザはいいねを取り消すことができる' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit root_path
    click_link 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    click_link '詳しく見る', match: :first
    first(:css, '.like').click
    wait_for_ajax

    expect do
      first(:css, '.unlike').click

      expect(page).to have_content 'いいね！する'
      expect(page).to_not have_content 'いいね！済み'
    end.to change(post.likes, :count).by(-1)
  end
end
