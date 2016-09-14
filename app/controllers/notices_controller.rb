class NoticesController < ApplicationController
  
  def index
    @notices = Notice.first(5)
    @wenzhangs = Taxon.first.wenzhangs.page(params[:page]).per(1)
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
    @wenzhangs = Taxon.first.wenzhangs.page(params[:page]).per(1)
    @taxons = Taxon.all
    @wikis = Wiki.all
  end

  def list
    @wikis = Wiki.all
    @writings = Wiki.first.writings.page(params[:page]).per(1)
  end

  private

    def notice_params
      params.require(:notice).permit(:title, :body)
    end
end
