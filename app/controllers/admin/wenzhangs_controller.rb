class Admin::WenzhangsController < Admin::BaseController
  layout 'admin'
  def new
    @wenzhang = Wenzhang.new
  end

  def show
    @wenzhang = Wenzhang.find(params[:id])
  end

  def edit
    @wenzhang = Wenzhang.find(params[:id])
  end

  def wz
    @wenzhangs = Wenzhang.all.page(params[:page]).per_page(2)
  end

  def create
    @wenzhang = Wenzhang.new(wenzhang_params)
    if @wenzhang.save
      flash[:success] = "success"
      redirect_to admin_root_url
    else
      render 'new'
    end
  end

  def update
    @wenzhang = Wenzhang.find(params[:id])
    if @wenzhang.update(wenzhang_params)
      flash[:success] = "success"
      redirect_to admin_root_url
    else
      render 'edit'
    end
  end

  def destroy
    @wenzhang = Wenzhang.find(params[:id])
    if @wenzhang.destroy
      flash[:success] = "deleted"
      redirect_to admin_root_url
    end
  end

  private

  def wenzhang_params
    params.require(:wenzhang).permit(:head, :content, :taxon_id)
  end
end