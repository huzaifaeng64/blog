class PostsController < ApplicationController
	 http_basic_authenticate_with name: "ali", password: "ali"
	# before _Action :check_authorization

	include ActionController::Live

	def stream
		@post = Post.all

		response.headers['Content-Type'] = 'text/event-stream'
    	@post.each do  |p|
      		response.stream.write "#{p.title}\n"
      		sleep 0.1
    		end
  		ensure
    	response.stream.close
  	end
  #	private def check_authorization
  #		railse User::NotAuthorized unless current_user.admin?
  #	end

	#USERS = { "lifo" => "world" }
 
 	#before_action :authenticate
 
  	#private
 	#def authenticate
     # authenticate_or_request_with_http_digest do |username|
      #  USERS[username]
      #end
    #end

  #	def download_pdf
  #  	post = Post.find(params[:id])
  #  	send_data generate_pdf(post),
  #           filename: "test.pdf",
  # 		        type: "application/pdf"
  #	end
 
  	private def generate_pdf(post)
      Prawn::Document.generate("test.pdf") do
        text "Hello World!"
      end.render
    end

  # def download_pdf
    # post = Post.find(params[:id])
  #  send_file("Users/imac/Desktop/blank.pdf",
  #            filename: "blank.pdf",
   #           type: "application/pdf",
    #          stream: true)
 # end

	def index
		@post = Post.all
		# stream
	end

	def new
		@post = Post.new
	end
	
	def show
		@post = Post.find(params[:id])

		# ** not working **
	#	respond_to do |format|
	 #     format.html
    #	  format.pdf { render pdf: generate_pdf(@post) }
    #	end

    #	response.headers['Content-Type'] = 'text/event-stream'
    #	10.times {
     # 		response.stream.write "hello world\n"
      #		sleep 0.1
    #	}
  	#	ensure
    #	response.stream.close

	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_param)

  		if @post.save
  		#	redirect_to @post
  		#	render plain: "post created!"
  		@post = Post.all   						# Render inline
			render inline: "<% @post.each do |p| %>
				<p><%= p.title %></p>
			<% end %>"
  		else
  			render 'new'
  		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_param)
		#	redirect_to @post
		#	render plain: "post edited  //  render via plain text"			# render text
		#	render html: helpers.tag.strong('updated  /// render via html')		# render html
		#	render json: @post								# ender json format
		#	render :xml => @post 			# not working		# render XML
		#	render js: "post updated /// render via js"				# render js (javascript)
			render body: "updated post   //  render via body", formats: [:json, :xml]
		#	render variants: [:mobile, :desktop]				# render body
		#	render file: "Users/imac/Desktop/render_file.html", layout: true 		# render file
		#	render status: 200
		# not working	render :xml => @post, :status => :created, :location => post_url(@post)
#head 404
		else
			render 'edit'
		end
	end

	private
  def post_param
   params.require(:post).permit(:title, :text)
  end

end
