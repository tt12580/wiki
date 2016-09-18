class WenzhangsController < ApplicationController

  def show
    @wenzhang = Wenzhang.find(params[:id])
  end

  private

    def wenzhang_params
      params.require(:wenzhang).permit(:head, :content, :author, :taxon_id)
    end

end
