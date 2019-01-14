class BooksController < ApplicationController

  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all.order(id: "asc")
    @book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	    if book.save
           redirect_to book_path(book.id)
           flash[:notice] = 'Book was successfully created.'
        else
           render books_path(book.id)
        end

  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
        if book.update(book_params)
           redirect_to book_path(book.id)
           flash[:notice] = 'Book was successfully updated.'
        else
           render books_path(book.id)
        end
  end

  def destroy
  	book = Book.find(params[:id])
  	    if book.destroy
  	       redirect_to books_path
           flash[:notice] = 'Book was successfully destroyed.'
        else
           render books_path(book.id)
        end
  end


    private

    def book_params
      params.require(:book).permit(:title, :body)
    end

end
