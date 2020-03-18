class Admin::UsersController < Admin::BaseController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:create, :destroy]

  def index
    @users = User.all.page(params[:page]).per(10) 
  end
  
  def show
    @user = User.find params[:id]
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.new user_params
    if @user.save 
      flash[:success] = t(".welcome")
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = t(".profile_updated")
      redirect_to admin_user_path
    else
      render :edit 
    end
  end
  
  def destroy
    @user = User.find_by id: params[:id]
    @user.destroy
    flash[:success] = t(".user_deleted")
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit :name, :email, :password, 
        :password_confirmation
    end

    # Before fillers

    # Confirms a admin user
    def admin_user 
      redirect_to(root_url) unless current_user.admin?
    end

    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        flash[:danger] = t(".please_log_in")
        redirect_to login_url
      end
    end

    # Correct_user
    def correct_user
      @user = User.find params[:id]
      redirect_to root_url unless current_user?(@user)
    end
end
