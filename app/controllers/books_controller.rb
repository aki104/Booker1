class BooksController < ApplicationController
  def new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@book = Book.new
  	# order(created_at: :desc) 降順にする
    @books = Book.all.order(created_at: :desc)
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  	flash[:success] = 'Book was successfully created..'
  	redirect_to book_path(@book.id)
  	 else
    	@books = Book.all.order(created_at: :desc)
     	render :new
     end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id)
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path
  end

  private


  def book_params
	params.require(:book).permit(:title, :body)
  end
end
