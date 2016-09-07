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

  def event
    @notices = Notice.all
  end

  def more
    @notices = Notice.all
    @wenzhangs = Taxon.first.wenzhangs.page(params[:page]).per_page(1)
    @taxons = Taxon.all
    @wikis = Wiki.all
  end

  def list
    @wikis = Wiki.all
    @writings = Writing.all
  end

  private

    def notice_params
      params.require(:notice).permit(:title, :body)
    end
end
