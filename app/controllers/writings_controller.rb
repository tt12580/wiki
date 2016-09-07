class WritingsController < ApplicationController

  def show
    @writing = Writing.find(params[:id])
  end

  private

    def writing_params
      params.require(:writing).permit(:name, :mainbody, :wiki_id)
    end
end
