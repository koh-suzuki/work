class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :destroy, :update]
  def index
    @articles = Article.order(created_at: :desc)
  end
  
  def show
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params_article)
    if @article.save
      redirect_to articles_path, notice: "新規作成できました。"
    else
      render :new, alert: "作成に失敗しました。"
    end
  end

  def edit
  end
  
  def update
    if @article.update(params_article)
      redirect_to articles_path, notice: "更新できました。"
    else
      render :edit, alert: "更新に失敗しました。"
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, notice: "削除しました。"
    else
      render :show, alert: "削除できませんでした。"
    end
  end
  
  private
    def find_article
      @article = Article.find(params[:id])
    end
    
    def params_article
      params.require(:article).permit(:title, :content)
    end
end
