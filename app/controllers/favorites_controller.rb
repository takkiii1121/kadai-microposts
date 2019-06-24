class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find_by(content: params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to likes_user_url(current_user.id)
  end

  def destroy
    micropost = Micropost.find_by(content: params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りから削除しました。'
    redirect_to likes_user_url(current_user.id)
  end
end
