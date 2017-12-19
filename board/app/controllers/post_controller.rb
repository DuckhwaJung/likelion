class PostController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  end

  def create

  	@t = params[:title]
  	@c = params[:content]

  	# @post = Post.new
  	# @post.title = @t
  	# @post.content = @c
  	# @post.save
  	

  	Post.create(title: @t, content: @c )
  	 redirect_to '/'
  end

  def show
  	@id = params[:id]
  	@post = Post.find(@id)
  end
  def destroy
  	@id = params[:id]
  	@post = Post.find(@id)
  	@post.destroy

  	redirect_to '/'
  end

  def edit
@id = params[:id]
@edit_post = Post.find(@id)

  end
  def update

  	@id = params[:id]
  	@update_post = Post.find(@id)

  	@tt = params[:title]
  	@cc = params[:content]

  	# @update_post.title = @tt
  	# @update_post.content = @cc
  	# @update_post.save

  	@update_post.update(title: @tt , content: @cc)

  	redirect_to "/post/show/#{@id}"


  end


end
