# require 'rails_helper'

# RSpec.describe "Posts", type: :request do

#   describe "#index" do
#     it "正常なレスポンスを返すこと" do
#       get '/posts'
#       expect(response).to be_successful
#       expect(response).to have_http_status "200"
#     end
#   end
  
  # describe "#create" do
  #   context "認証済みのユーザとして" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #     end
  #     context "有効な属性値の場合" do
  #       it "ポストを追加できること" do
  #         post_params = FactoryBot.attributes_for(:post)
  #         sign_in @user
  #         expect {
  #           post posts_path, params: {post: post_params}
  #         }.to change(@user.posts, :count).by(1)
  #       end
  #     end
  #   end
  # end

# end
