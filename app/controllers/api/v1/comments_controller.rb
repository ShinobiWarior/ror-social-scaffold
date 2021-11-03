class Api::V1::CommentsController < ApiController
  before_action :set_comments
  def index 
  end
  def create 
    @comment = Comment.new(comment_params) 
    @comment.post_id = params[:post_id] 
    @token = request.headers.fetch("Authorization", "").split(" ").last 
    @user_id = JsonWebToken.decode(@token).first 
    @comment.user = User.find(@user_id.last) 
    if @comment.save 
      render json: { success: ['Comment was successfully created.']} 
    else 
      render json: { errors: ['Adding coment failed!'] } 
    end 
    rescue JWT::VerificationError 
      render json: { Errors: ["Invalid auth token"]}, status: :unauthorized 
    rescue JWT::ExpiredSignature 
      render json: { Errors: ["Auth token has expired"]}, status: :unauthorized 
    end 
   

  private 

  def set_comments
    @post = Post.find(params[:post_id])
    @comments = @post.comments 
  rescue ActiveRecord::RecordNotFound
    render json: { Errors: "No comments"}
  end
  def comment_params 
    params.permit(:content) 
  end 
end