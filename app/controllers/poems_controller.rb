class PoemsController < ApplicationController
  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.create(poem_params)

    respond_with @poem
  end

  def show
    @poem = Poem.find(params[:id])
  end

  private
  def poem_params
    params.require(:poem).permit(:title, :status, :user_id)
  end
end
