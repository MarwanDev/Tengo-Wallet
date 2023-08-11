class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  # GET /transactions or /transactions.json
  def index
    @transactions = Category.find(@category.id).transactions.order(created_at: :desc)
  end

  # GET /transactions/1 or /transactions/1.json
  def show; end

  # GET /transactions/new
  def new
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.build
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions or /transactions.json
  def create
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.build(transaction_params)
    @transactions.author = current_user
    Rails.logger.info @item.inspect

    respond_to do |format|
      if @transactions.save
        @transactions.categories.push(Category.find(params[:category_id]))
        format.html { redirect_to categorie_transactions_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :author_id, :amount, :group_id)
  end
end
