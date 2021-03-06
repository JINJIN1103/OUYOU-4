class BooksController < ApplicationController
  def index
     @book = Book.new
     @user = current_user
     @books = Book.all

     #@users = Book.find(user_id)
  end

  def create
   @user = current_user
   @books =Book.all
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
      flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book)
   else
      render 'index'
   end
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
    @book_comment = BookComment.new
    # @book_comments = BookComment.find(@user)
    #@user = User.find(params[:id])
    #@user = current_user
    #@bookss = @books.user
  end

  def edit
    @book = Book.find(params[:id])
     unless
    @book.user == current_user
     redirect_to books_path
     end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

 private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
