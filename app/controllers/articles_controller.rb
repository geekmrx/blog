class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show # action
    # params[:id] -> id captured by the route parameter.
    # The returned article is stored in the @article instance variable
    # accessible by the view
    @article = Article.find(params[:id])
  end

  def new # action 
    # instantiates a new article, but does not save it.
    @article = Article.new 
  end 

  def create # action
    # instantiates a new article with value s for the title and body, 
    # and attempts save it
    #@article = Article.new(title: "...", body: "...")
    @article = Article.new(article_params)
    
    # if the article is saveed sucessfully, 
    # the action redirects  the browser to the article's page
    if @article.save
      # redirect_to -> the browser to make a new request
      redirect_to @article
    else
      # the action redisplays the
      # with status code 422
      # render -> renders the specified view for the current request
      render :new, status: :unprocessable_entity 
    end 
  end

  private 
    def article_params
      # we will pass a single Hash that contains the values
      # we must still specify what values are allowed in that Hash.
      # Caso contrário, um malicious user poderia submit extra form fields
      # and overwrite private data.
      params.require(:articles).permit(:title, :body)
    end
end
