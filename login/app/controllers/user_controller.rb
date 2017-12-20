class UserController < ApplicationController
  def index
  	if session[:user_id]
  		@email = User.find(session[:user_id]).email

  	end
  end

  def new
  end

  def login
  end
  def logout
  	session.clear
  	redirect_to '/'
  end
  def login_process
  	require 'digest'
  	require 'pry'
	@email = params[:email]
  	@password = params[:password]

  	#아이디와 비밀번호가 일치하면 로그인
  	#일치하지 않으면 로그인 되지 않게 한다.
  	
	#user  가  있는지부터 먼저 검사
	if User.exists?(email: @email)

		# 아이디와 비밀번호가 잂치할때 
	  	user = User.find_by(email: @email)
	  	# binding.pry
  		if user.password == Digest::MD5.hexdigest(@password)
  			session[:user_id] = user.id

  			redirect_to '/'
  		
  		end
 	end
 # 일치 하지 않을때

  end

  def create
  	require 'digest'
  	@email = params[:email]
  	@password = params[:password]

  	hidden_password = Digest::MD5.hexdigest(@password)

  	User.create( email: @email, password: hidden_password)

  	redirect_to '/'
  end
end
