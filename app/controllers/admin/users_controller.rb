class Admin::UsersController < Admin::BaseController
  authorize_resource
  layout 'admin'
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "success"
      redirect_to admin_root_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "success"
      redirect_to edit_admin_user_path(@user)
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, roles: [])
    end

end
