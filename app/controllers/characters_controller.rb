class CharactersController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
  	@character = current_user.characters.build(params[:character])
  	if @character.save
  		flash[:success] = "Character created!"
  		redirect_to root_url
  	else
      @feed_items = []
  		render 'static_pages/home'
  	end
  end

  def destroy
    @character.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @character = current_user.characters.find_by_id(params[:id])
      redirect_to root_url if @character.nil?
    end
end