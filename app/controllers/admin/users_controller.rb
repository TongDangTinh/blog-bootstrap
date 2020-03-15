class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all 
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
      flash[:success] = "Welcome to my blog!"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit :name, :email, :password, 
        :password_confirmation
    end
end
