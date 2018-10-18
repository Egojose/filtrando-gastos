class ExpensesController < ApplicationController
  def index
     @expenses = Expense.order("date DESC")
     @expenses = params[:concept].present? ? @expenses.where("concept LIKE ?", "%#{params[:concept]}%") : @expenses
     @expenses = params[:category_id].present? ? @expenses.where(category_id: params[:category_id]) : @expenses
  end

  # order("date DESC")

end
