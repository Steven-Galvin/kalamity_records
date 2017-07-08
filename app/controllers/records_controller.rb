class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
    flash[:notice] = "Record successfully added!"
      redirect_to  record_path(@record)
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      flash[:notice] = "Record successfully updated!"
      redirect_to record_path(@record)
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.reviews.each do |review|
      review.destroy
    end
    if @record.destroy
      flash[:notice] = "Record successfully removed!"
      redirect_to records_path
    end
  end

private
  def record_params
    params.require(:record).permit(:title, :artist, :price, :description, :album_length, :genre)
  end
end
