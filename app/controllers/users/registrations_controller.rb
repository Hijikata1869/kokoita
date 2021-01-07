class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]

  def check_guest
    redirect_to root_path, alert: 'ゲストユーザの変更・削除はできません' if resource.email == 'guest@example.com'
  end
end
