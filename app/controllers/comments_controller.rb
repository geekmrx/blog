class CommentsController < ApplicationController
  def create
    # get the article in question.
    @article = Article.find(params[:article_id])
    # create and save the comment.
    # automatically link the comment so that it belongs to that particular article.
    @comment = @article.comments.create(comment_params)
    # send the user back to the original article 
    redirect_to article_path(@article)
  end

  private 
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
