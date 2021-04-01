class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(user_params)

    # if @article.valid?
    if @article.save
      flash[:notice] = "Article saved successfully"
      redirect_to @article # article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(user_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      flash[:notice] = "Article successfully deleted"
      redirect_to articles_path
    else
    end
    
  end

  private

  def user_params
    params.require(:article).permit(:title, :description)
  end
end