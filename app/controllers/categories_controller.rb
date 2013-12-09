class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    respond_to do |format|
      format.html
      format.yaml { render text:@categories.to_yaml }
      format.json { render text:@categories.to_json }
    end
  end

  def show
    @category  = Category.find(params[:id])

    respond_to do |format|
      format.html
      format.yaml { render text:@category.to_yaml }
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(post_params)
    if @category.save
      flash[:notice] = "Category created"
      redirect_to category_path(@category)
    else
      flash[:error] = @category.errors
      render 'new'
    end
  end

  def edit
    @category  = Category.find(params[:id])
    render 'edit'
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(post_params)
      flash[:notice] = "Category updated"
      redirect_to category_path(@category)
    else
      flash[:error] = @category.errors
      render 'edit'
    end

  end

  private

  def post_params
    params.require(:category).permit(:name)
  end


end
