class CommentsController < ApplicationController
  

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment Published."
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "Coment Deleted successfully"
    redirect_to post_path(@post)
  end


  private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end