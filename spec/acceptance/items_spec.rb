# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Items' do
  let!(:item) { create(:item) }

  post '/items' do
    with_options scope: :item do
      parameter :name, 'Item name'
      parameter :price, 'Item price'
      parameter :description, 'Description item'
    end

    let(:name) { 'table' }
    let(:price) { 11 }
    let(:description) { 'Cool table' }

    example 'Creating item' do
      expect { do_request }.to change { Item.count }.by(1)
      item = Item.last
      expect(item.name).to eq(name)
      expect(item.price).to eq(price)
      expect(item.description).to eq(description)
      expect(status).to eq 200
    end
  end

  get '/items' do
    example_request 'Getting all items' do
      items_hash = JSON.parse(response_body, symbolize_names: true)
      expect(items_hash[0][:id]).to eq(item.id)
      expect(items_hash[0][:name]).to eq(item.name)
      expect(items_hash[0][:description]).to eq(item.description)
      expect(status).to eq 200
    end
  end

  get 'items/:id' do
    let(:id) { item.id }

    example_request 'Getting the item by id' do
      items_hash = JSON.parse(response_body, symbolize_names: true)
      expect(items_hash[:id]).to eq(item.id)
      expect(items_hash[:name]).to eq(item.name)
      expect(items_hash[:description]).to eq(item.description)
      expect(status).to eq 200
    end
  end

  patch 'items/:id' do
    with_options scope: :item do
      parameter :id, 'Item id'
      parameter :name, 'Item name'
      parameter :price, 'Item price'
      parameter :description, 'Item description'
    end

    let(:id) { item.id }
    let(:name) { 'table' }
    let(:price) { 11 }
    let(:description) { 'Cool table' }

    example_request 'Updating item' do
      expect(item.reload.id).to eq(id)
      expect(item.name).to eq(name)
      expect(item.price).to eq(price)
      expect(item.description).to eq(description)
      expect(status).to eq 200
    end
  end

  delete '/items/:id' do
    let(:id) { item.id }

    example 'Deleting item' do
      expect { do_request }.to change { Item.count }.by(-1)
      expect(status).to eq 204
    end
  end
end
