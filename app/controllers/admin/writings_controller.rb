class Admin::WritingsController < Admin::BaseController
  authorize_resource
  layout 'admin'
  def index
    @writings = Writing.
    search_name(params[:name]).
    search_mainbody(params[:mainbody]).
    search_writing_id(params[:id]).
    search_wiki_mulu(params[:mulu]).
    page(params[:page]).
    per(3)
  end

  def new
    @writing = Writing.new
  end

  def show
    @writing = Writing.find(params[:id])
  end


  def edit
    @writing = Writing.find(params[:id])
  end

  def create
    @writing = Writing.new(writing_params)
    if @writing.save
      flash[:success] = "success"
      redirect_to admin_root_url
    else
      render 'new'
    end
  end

  def update
    @writing = Writing.find(params[:id])
    if @writing.update(writing_params)
      flash[:success] = "success"
      redirect_to admin_writings_path
    else
      render 'edit'
    end
  end

  def destroy
    @writing = Writing.find(params[:id])
    if @writing.destroy
      flash[:success] = "deleted"
      redirect_to admin_root_url
    end
  end

  private

    def writing_params
      params.require(:writing).permit(:name, :mainbody, :wiki_id)
    end
end
