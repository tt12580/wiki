class WikisController < ApplicationController

  def show
    @wiki = Wiki.find(params[:id])
    @wikis = Wiki.all
    @writings = @wiki.writings.page(params[:page]).per_page(1)
  end

  private

    def wiki_params
      params.require(:wiki).permit(:mulu)
    end
end
