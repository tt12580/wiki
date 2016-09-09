class Admin::NoticesController < Admin::BaseController
  layout 'admin'
  def index
    @notices = Notice.all

  end

  def new
    @notice = Notice.new
  end

  def not
    @notices = Notice.
      all.
      search_title(params[:title]).
      search_notice_id(params[:id]).
      search_body(params[:body]).
      page(params[:page]).
      per_page(3)
  end

  def more
    @notices = Notice.all
    @wenzhangs = Taxon.first.wenzhangs.paginate(page: params[:page])
    @taxons = Taxon.all
    @wikis = Wiki.all
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def write
    @notices = Notice.all
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      flash[:success] = "success"
      redirect_to admin_root_url
    else
      render 'new'
    end
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update(notice_params)
      flash[:success] = "success"
      redirect_to admin_root_url
    else
      render 'edit'
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    if @notice.destroy
      flash[:success] = "deleted"
      redirect_to admin_root_url
    end
  end

  private

    def notice_params
      params.require(:notice).permit(:title, :body, :picture)
    end
end
