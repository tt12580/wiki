class NoticesController < ApplicationController

  def index
    @notices = Notice.first(5)
    @wenzhangs = Taxon.first.wenzhangs.paginate(page: params[:page]).per_page(1)
    @taxons = Taxon.all
    @wikis = Wiki.all
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def notice
    @notices = Notice.all
  end

  def more
    @notices = Notice.all
    @wenzhangs = Taxon.first.wenzhangs.page(params[:page]).per_page(1)
    @taxons = Taxon.all
    @wikis = Wiki.all
  end

  def wiki
    @wikis = Wiki.all
    @writings = Wiki.first.writings.page(params[:page]).per_page(1)
  end

  private

    def notice_params
      params.require(:notice).permit(:title, :body)
    end
end
