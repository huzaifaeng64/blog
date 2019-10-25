class CommentsController < ApplicationController

	def show
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
	end

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_param)
		if @comment.save
			redirect_to article_path(@article)
		else
			render template: "articles/show"
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy

		redirect_to article_path(@article)
	end

	private
		def comment_param
			params.require(:comment).permit(:commentor, :cmnt_body)
		end
end
