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

  def edit 
    # fetches the article from the database, and stores it in @article
    # so that it can be used when building the form.
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article 
    else 
      render :edit, status: :unprocessaable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private 
    def article_params
      # we will pass a single Hash that contains the values
      # we must still specify what values are allowed in that Hash.
      # Caso contrário, um malicious user poderia submit extra form fields
      # and overwrite private data.
      params.require(:article).permit(:title, :body)
    end
end
