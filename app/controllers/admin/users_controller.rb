class Admin::UsersController < Admin::BaseController
  authorize_resource
  layout 'admin'
  def index
    @users = User.all
  end

  def us
    @users = User.all
  end

  def edit
    @user.find(params[:id])
  end

  def update
    @user = User.find(user_params)
    if @user.update(params[:id])
      flash[:success] = "success"
      redirect_to admin_us_url
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :roles_mask)
    end

end
