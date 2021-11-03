class Api::V1::PostsController < ApiController
  before_action :set_posts

  def index; end

  private

  def set_posts
    @posts = Post.all
  end
end
