class FeedsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    f = Feedzirra::Feed.fetch_and_parse(params[:feed_url])
    @feed = Feed.create!(
      url:                  f.url,
      feed_url:             f.feed_url,
      title:                f.title,
      etag:                 f.etag,
      last_modified:        f.last_modified
    )
    Post.update_from_feed(params[:feed_url], @feed.id)
    @feed.update_attributes(newest_entry_url: @feed.posts.order(:published_at).first.url)
    redirect_to posts_path
  end

  def destroy
    Feed.find(params[:id]).destroy
    flash[:success] = "No more blog entries from them!"
    redirect_to posts_path
  end
  
end
