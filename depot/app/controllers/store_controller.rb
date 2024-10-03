class StoreController < ApplicationController
  def index
    session[:visit_count] = (session[:visit_count] || 0) + 1
    @visit_count = session[:visit_count].to_i
    @is_visit_count_visible = @visit_count > 5

    @products = Product.order(:title)
  end
end
