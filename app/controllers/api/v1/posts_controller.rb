class Api::V1::PostsController < ApiController
  def index 
  end

  private 

  def set_posts
    @posts = Post.all
  end
end