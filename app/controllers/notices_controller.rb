class NoticesController < ApplicationController

  def index
    @notices = Notice.first(5)
  end

  def new
    @notice = Notice.new
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def event
    @notices = Notice.all
  end

  def more
    @notices = Notice.all
  end

  def sanwen
    @notices = Notice.first(5)
  end

  def shige
    @notices = Notice.first(5)
  end

  def libai
  end

  def dufu
  end

  def list
    @notices = Notice.first(5)
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      flash[:success] = "success"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    if @notice.destroy
      flash[:success] = "deleted"
      redirect_to root_url
    end
  end

  private

    def notice_params
      params.require(:notice).permit(:title, :body)
    end
end
