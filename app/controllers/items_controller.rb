# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :load_item, only: %i[show update destroy]

  def index
    render json: Item.all.page(params[:page])
  end

  def show
    render json: item
  end

  def create
    item = Item.new(user: current_user, **item_params)
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

  def current_user
    @current_user ||= User.first
  end
end
