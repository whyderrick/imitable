class PoemsController < ApplicationController
  def new
    @poem = Poem.new
  end

  def create
    @poem = current_user.poems.create(poem_params)

    respond_with @poem
  end

  def show
    poem = Poem.includes(:submissions).find(params[:id])

    render "show", locals: { poem: poem }
  end

  private

  def poem_params
    params.require(:poem).permit(:title, :status)
  end
end
