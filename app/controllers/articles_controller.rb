class ArticlesController < ApplicationController


# def preview
#  @article = Article.new(article_params)
# end

 def index
  @article = Article.all
 end

 def show
  @article = Article.find_by(id: params[:id])
  
  #  redirect_to action: :index    # costly method due to round trip of requests
  #  head :bad_request 

 end

 def new
 	@article = Article.new
  @article.comments.build
 end

 def edit
  @article = Article.find(params[:id])
  @article.comments.build
 end

 def create
  @article = Article.new(article_params)
  if @article.save
  	redirect_to @article
  else
    render 'new'
  end
 end

  def update
  	@article = Article.find(params[:id])

  	if @article.update(article_params)
  		redirect_to @article
  	else
  		render 'edit'
  	end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

 private
  def article_params
   params.require(:article).permit(:title, :text, comments_attributes: [:id, :commentor, :cmnt_body, :_destroy])
  # params.fetch(:article, {}).permit(:title, :text)
  # params.require(:article).permit(:title, :text, comments: [:commentor, :id, :destroy])
  end
 
 
end
