class Admin::ReviewsController < AdminController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new reviews_params
    if @review.save
      flash[:success] = "#{@review.name} has been created successfully"
      redirect_to admin_reviews_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find params[:id]
  end

  def update
    @review = Review.find params[:id]
    if @review.update_attributes reviews_params
      flash[:success] = "#{@review.name} has been updated successfully"
      redirect_to [:admin, @review]
    else
      render :edit
    end
  end

  def show
    @review = Review.find params[:id]
  end

  def destroy
    @review = Review.find params[:id]
    if @review.destroy
      flash[:success] = "Brand has been deleted successfully"
    else
      flash[:danger] = "Can not delete this brand"
    end
  end

  private
  def reviews_params
    params.require(:review).permit Review::ATTRIBUTES_PARAMS
  end
end
