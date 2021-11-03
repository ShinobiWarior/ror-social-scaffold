class Api::V1::CommentsController < ApiController
  before_action :set_comments
  def index 
  end

  private 

  def set_comments
    @post = Post.find(params[:post_id])
    @comments = @post.comments 
  rescue ActiveRecord::RecordNotFound
    render json: { Errors: "No comments"}
  end
end