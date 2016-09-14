class Admin::WenzhangsController < Admin::BaseController
  authorize_resource
  layout 'admin'
  def index
    @wenzhangs = Wenzhang.
    search_head(params[:head]).
    search_content(params[:content]).
    search_wenzhang_id(params[:id]).
    search_taxon_list(params[:list]).
    page(params[:page]).
    per(2)
  end
  
  def new
    @wenzhang = Wenzhang.new
  end

  def show
    @wenzhang = Wenzhang.find(params[:id])
  end

  def edit
    @wenzhang = Wenzhang.find(params[:id])
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
