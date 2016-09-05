class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @instapost  = current_user.instaposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end