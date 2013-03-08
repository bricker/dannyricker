class PagesController < ApplicationController
  before_filter :login_required, except: [:show, :index, :home]
  before_filter :get_page, only: [:show, :edit, :update, :destroy]
  
  respond_to :html

  #--------------------

  def home
    layout 'homepage'
    @page = Page.find_by_slug('homepage')
  end

  #--------------------

  def index
    @pages = Page.order("created_at")
  end

  #--------------------
  
  def new
    @page = Page.new
  end

  #--------------------

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Created page"
      redirect_to show_page_path(@page)
    else
      respond_with @page
    end
  end

  #--------------------

  def update
    if @page.update_attributes(page_params)
      flash[:notice] = "Updated page"
      redirect_to show_page_path(@page)
    else
      respond_with @page
    end
  end

  #--------------------
  
  def destroy
    flash[:notice] = "Removed page" if @page.destroy
    respond_with @page
  end

  #--------------------

  private

  def get_page
    @page = Page.find_by_slug!(params[:id])
  end

  #--------------------

  def page_params
    params.require(:page).permit(:title, :slug, :content)
  end
end
