class HomeController < ApplicationController
  def index
    @authors = Author.all
    @books = Book.all
    @borrowers = Borrower.all
    @borrowings = Borrowing.all
  end
end
