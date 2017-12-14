class PoliciesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
  end

  def due_today
    # from_date = params[:from_date]
    # to_date = params[:to_date]
    @initializer = Policy.where(inception: 1.months.ago..Date.today).order(sort_column + " " + sort_direction).includes(:assured, [:commission_invoice => :intermediary], :pdc_payments, :policy_invoice, :policy_payments).page(params[:page]).per(10)

    @policies = @initializer.select {|policy| policy.due_date.present? && policy.due_date == Date.today}
  end

  def show
    @policy = Policy.find(params[:id])
  end

  def motor_declarations
  end

  def travel_declarations
  end

  private

  def sort_column
    Policy.column_names.include?(params[:sort]) ? params[:sort] : "incept_date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
