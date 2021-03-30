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

  private

  def user_params
    params.require(:article).permit(:title, :description)
  end
end