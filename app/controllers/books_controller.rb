class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    return if params[:query].blank?

    @books = @books.where('title LIKE ?', "%#{params[:query]}%")
                   .or(Book.where('author LIKE ?', "%#{params[:query]}%"))
  end
end
