class Admin::WikisController < Admin::BaseController
  layout 'admin'
  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
    @wikis = Wiki.all
    @writings = @wiki.writings.paginate(page: params[:page]).per(1)
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def wi
    @wikis = Wiki.all.page(params[:page]).per_page(1)
  end

  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
      flash[:success] = "success"
      redirect_to admin_root_url
    else
      render 'new'
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update(wiki_params)
      flash[:success] = "success"
      redirect_to admim_root_url
    else
      render 'edit'
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:success] = "deleted"
      redirect_to admin_root_url
    end
  end

  private

    def wiki_params
      params.require(:wiki).permit(:mulu)
    end
end
