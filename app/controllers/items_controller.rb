# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :load_item, only: %i[show update destroy]
  before_action :authenticate_user, only: %i[create]

  def index
    items = Item.all
    filtering_params.each do |filter, value|
      items = items.public_send(filter, value)
    end

    render json: items.page(params[:page])
  end

  def show
    render json: item
  end

  def create
    item = Item.new(user: current_user, category: category, **item_params)
    return render_errors(item.errors) unless item.save

    render json: item
  end

  def update
    return render_errors(item.errors) unless item.update(item_params)

    render json: item
  end

  def destroy
    item.destroy
  end

  private

  attr_reader :item

  def item_params
    params.require(:item).permit(:name, :price, :description)
  end

  def load_item
    (@item = Item.find_by(id: params[:id])) || head(:not_found)
  end

  def category
    @category = Category.first
  end

  def current_user
    @current_user ||= User.first
  end

  def filtering_params
    params.permit(
      :by_city, :by_name, :by_category, :by_user, :price_min, :price_max,
      :by_options
    )
  end
end
