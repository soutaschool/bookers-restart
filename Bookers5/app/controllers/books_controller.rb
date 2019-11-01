class BooksController < ApplicationController
  before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    	flash[:notice] = 'successfully'
       redirect_to @book
    else
      @books = Book.all
      render 'index'
    end
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_url #リダイレクトするときは_urlを使用する。それ以外は_pathを使う。
  end

  def edit
  	@book = Book.find(params[:id])
  	scrren_user(@book)
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		flash[:notice] = 'successfully'
      redirect_to @book
    else
      render 'edit'
    end  #updateアクションでモデルに対するupdateメソッドの呼び出しが失敗すると、
    #同じコントローラに用意しておいた別のedit.html.erbテンプレートを使用して出力
  end


  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def scrren_user(book)
    	if book.user.id != current_user.id
    		redirect_to books_path
    	end
    end

end
