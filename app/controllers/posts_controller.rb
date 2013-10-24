class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :feed]
  before_filter :check_for_cancel, only: [:create, :update]

  def create
    params[:post][:published_at] = Time.current()
    params[:post][:guid] = "ERBlog-" + ('a'..'z').to_a.shuffle[0,8].join
    params[:post][:feed_id] = 1
    params[:post][:author] = current_user.name
    @post = current_user.posts.build(params[:post])
    if @post.save
      @post.update_attributes(url: "http://ecorebox.com/news/#{@post.id}")
      flash[:success] = "Blog entry created!"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong there... try again."
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Blog entry deleted!"
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def feed
    before = Post.all.size
    Feed.all.reject{ |f|f.id == 1 }.each do |feed|
      Post.update_from_feed(feed.feed_url, feed.id)
    end
    after = Post.all.size
    if after - before > 0
      flash[:success] = "Blog updated with #{after - before} entries!"
    else
      flash[:notice] = "Nothing to update..."
    end
    redirect_to posts_path
  end

  def index
    # this will be the name of the feed displayed on the feed reader
    @title = "Eco ReBoxing"
    # the news items
    @posts = Post.page(params[:page]).per(10)
    # this will be our Feed's update timestamp
    @updated = @posts.first.updated_at unless @posts.empty?

    respond_to do |format|
      format.html
      format.atom { render layout: false }
      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to posts_path(format: :atom), status: :moved_permanently }
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @categories = @post.categories
    @user = @post.user ? @post.user.name : @post.author
    @published = @post.published_at ? @post.published_at : @post.created_at
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Blog Entry updated!"
      redirect_to @post
    else
      flash[:error] = "Something went wrong there... try again."
      render 'posts/edit'
    end
  end

  private

    def check_for_cancel
      if params[:commit] == "Cancel"
        redirect_to posts_path
      end
    end

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end
end
