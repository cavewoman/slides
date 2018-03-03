class PresentationsController < ApplicationController
  before_action :set_presentation, only: %i[show edit update destroy]

  def index
    @presentations = Presentation.all
  end

  def show
    @slides = @presentation.slides.sort_by(&:number)
  end

  def new
    @presentation = Presentation.new
  end

  def edit
  end

  def create
    @presentation = Presentation.new(presentation_params)

    if @presentation.save
      redirect_to @presentation, notice: "Presentation was successfully created."
    else
      render :new
    end
  end

  def update
    if @presentation.update(presentation_params)
      redirect_to @presentation, notice: "Presentation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @presentation.destroy
    redirect_to presentations_url, notice: "Presentation was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_presentation
    @presentation = Presentation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def presentation_params
    params.require(:presentation).permit(:title, :presenter, :theme)
  end
end
