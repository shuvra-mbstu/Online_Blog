class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
   @article = Article.find(params[:id])
 end
 
  def new
    @article = Article.new
  end
   
  def edit
    @article = Article.find(params[:id])
  end
   
  def create
    @article = Article.new(article_params)
   
    if @article.save
      flash[:notice] = 'Article has been created successfully!'
      redirect_to @article
    else
      flash[:notice] = 'Article could not be created!'
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      flash[:notice] = 'article updated successfully!'
      redirect_to @article
    else
      flash[:notice] = 'Failed to update the article.'
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      flash[:notice] = 'Article deleted successfully!'
      redirect_to articles_path
    else
      flash[:notice] = 'Failed to delete the article.'
      redirect_to articles_path
    end
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

