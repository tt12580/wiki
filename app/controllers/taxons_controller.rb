class TaxonsController < ApplicationController

  def show
    @taxon = Taxon.find(params[:id])
    @wenzhangs = @taxon.wenzhangs.page(params[:page]).per_page(1)
    @notices = Notice.first(5)
    @taxons = Taxon.all
    @wikis = Wiki.all
  end

  private

    def taxon_params
      params.require(:taxon).permit(:list)
    end
end
