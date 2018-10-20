class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index

        puts current_user
        puts @expense_id
        if @expense_id == current_user
          @expenses = Expense.order("date DESC")
         if params[:concept].present?
           @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
         end
         if params[:category_id].present?
           @expenses = @expenses.where("category_id = ?", params[:category_id])
         end
       else
         redirect_to root_path
       end
  end
end
