class UsersController < ApplicationController
  skip_before_action :require_authentication, only: [ :new, :create ]
  before_action :set_user, only: %i[ edit update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Usuário criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @users = User.all
  end
  def edit
  end
  def update
    if @user.update(user_params)
      render :edit
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.expect(user: [ :email_address, :password, :password_confirmation, :name, :featured_image, :description ])
  end
end
