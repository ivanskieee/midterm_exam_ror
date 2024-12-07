class BorrowingsController < ApplicationController
  def index
    @borrowings = Borrowing.all
  end

  def show
    @borrowing = Borrowing.find(params[:id])
  end

  def new
    @borrowing = Borrowing.new
    @borrowers = Borrower.all
    @books = Book.all
  end

  def create
    @borrowing = Borrowing.new(borrowing_params)
    if @borrowing.save
      redirect_to @borrowing
    else
      render :new
    end
  end

  def edit
    @borrowers = Borrower.all
    @books = Book.all
    @borrowing = Borrowing.find(params[:id])
  end

  def update
    @borrowing = Borrowing.find(params[:id])

    if @borrowing.update(borrowing_params)
      redirect_to @borrowing
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @borrowing = Borrowing.find(params[:id])
    @borrowing.destroy

    redirect_to borrowings_path, status: :see_other
  end

  private
  def borrowing_params
    params.require(:borrowing).permit(:borrower_id, :book_id, :borrowed_on, :returned_on)
  end
end
