class ReviewsController < ApplicationController
  def new
    @record = Record.find(params[:record_id])
    @review = @record.reviews.new
  end

  def create
    @record = Record.find(params[:record_id])
    @review = @record.reviews.new(review_params)
    if @review.save
    flash[:notice] = "Review successfully added!"
      redirect_to  record_path(@record)
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:record_id])
    @review = Review.find(params[:id])
  end

  def update
    @record = Record.find(params[:record_id])
    @review= Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to record_path(@record)
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:record_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Review successfully removed!"
      redirect_to record_path(@record)
    end
  end

private
  def review_params
    params.require(:review).permit(:user_id, :content, :rating)
  end
end
