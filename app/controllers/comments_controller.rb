class CommentsController < ApplicationController

  def new
    @journey = Journey.find(params[:journey_id])
    @comment = Comment.new
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @comment = Comment.create(comment_params)
    @comment.journey = @journey
    @comment.user = current_user
    if @comment.save
      redirect_to journey_path(@comment.journey_id)
    else
      flash[:notice] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:name, :body, :journey_id, :user_id)
  end

end
