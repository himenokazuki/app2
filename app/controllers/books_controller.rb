class BooksController < ApplicationController
  def new
     # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end

# 以下を追加
  def create
     @book = Book.new(book_params)
    if @book.save
       flash[:notice] = "successfully "
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render  :index
    end
  end
  def index
   @book = Book.new
   @books =Book.all

  end

  def show
  @book=Book.find(params[:id])
  end

  def edit
  @book=Book.find(params[:id])
  flash[:notice] = "successfully "
  end

  def update
       @book = Book.find(params[:id])
       @book.update(book_params)
    if @book.save
       flash[:notice] = "successfully "
      redirect_to book_path(@book.id)
    else
       @books=Book.all
      render  :index
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to'/books'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end