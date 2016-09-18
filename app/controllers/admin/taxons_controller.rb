class Admin::TaxonsController < Admin::BaseController
  authorize_resource
  layout 'admin'
  def index
    @taxons = Taxon.
    search_list(params[:list]).
    search_taxon_id(params[:id]).
    page(params[:page]).
    per(2)
  end

  def new
    @taxon = Taxon.new
  end

  def show
    @taxon = Taxon.find(params[:id])
    @wenzhangs = @taxon.wenzhangs
    @notices = Notice.all
    @taxons = Taxon.all
    @wikis = Wiki.all
  end

  def edit
    @taxon = Taxon.find(params[:id])
  end

  def create
    @taxon = Taxon.new(taxon_params)
    if @taxon.save
      flash[:success] = "success"
      redirect_to admin_root_url
    else
      render 'new'
    end
  end

  def update
    @taxon = Taxon.find(params[:id])
    if @taxon.update(taxon_params)
      flash[:success] = "success"
      redirect_to admin_taxons_path
    else
      render 'edit'
    end
  end

  def destroy
    @taxon = Taxon.find(params[:id])
    if @taxon.destroy
      flash[:success] = "deleted"
      redirect_to admin_root_url
    end
  end

  private

    def taxon_params
      params.require(:taxon).permit(:list)
    end
end
