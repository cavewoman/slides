class SlidesController < ApplicationController
  before_action :set_slide, only: %i[show edit update destroy]

  def index
    @slides = Slide.all
  end

  def show
  end

  def new
    @slide = Slide.new(presentation_id: params[:presentation_id])
  end

  def edit
  end

  def create
    @slide = Slide.new(slide_params)

    if @slide.save
      redirect_to @slide, notice: "Slide was successfully created."
    else
      render :new
    end
  end

  def update
    if @slide.update(slide_params)
      redirect_to @slide, notice: "Slide was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @slide.destroy
    redirect_to slides_url, notice: "Slide was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_slide
    @slide = Slide.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def slide_params
    params.require(:slide).permit(:title, :header, :number, :body, :presentation_id)
  end

  def new_slide_params
    params.require(:slide).permit(:presentation_id)
  end
end
