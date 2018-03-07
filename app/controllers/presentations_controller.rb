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
    if admin_signed_in?
      @presentation = Presentation.new(presentation_params)

      if @presentation.save
        redirect_to @presentation, notice: "Presentation was successfully created."
      else
        render :new
      end
    else
      redirect_to "/", notice: "You must be signed in to create a new presentation."
    end
  end

  def update
    if admin_signed_in?
      if @presentation.update(presentation_params)
        redirect_to @presentation, notice: "Presentation was successfully updated."
      else
        render :edit
      end
    else
      redirect_to @presentation, notice: "You must be signed in to update a presentation."
    end
  end

  def destroy
    if admin_signed_in?
      @presentation.destroy
      redirect_to presentations_url, notice: "Presentation was successfully destroyed."
    else
      redirect_to presentations_url, notice: "You must be signed in to remove a presentation."
    end
  end

  def presentation_intro
    @presentation = Presentation.find(params[:id])
    slides = @presentation.slides.sort_by(&:number)
    @next_slide = slides[0]
    render :intro_slide
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
