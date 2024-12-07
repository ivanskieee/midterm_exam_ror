class BorrowersController < ApplicationController
  def index
    @borrowers = Borrower.all
  end

  def show
    @borrower = Borrower.find(params[:id])
  end

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      redirect_to @borrower
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @borrower = Borrower.find(params[:id])
  end

  def update
    @borrower = Borrower.find(params[:id])

    if @borrower.update(borrower_params)
      redirect_to @borrower
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @borrower = Borrower.find(params[:id])
    @borrower.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def borrower_params
      params.require(:borrower).permit(:name)
    end
end
