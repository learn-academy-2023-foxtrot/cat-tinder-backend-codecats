require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Franklin',
        age: 5,
        hobbies: 'eating toilet paper',
        image: 'https://unsplash.com/photos/7DXQtl__9Cw'
      )

      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
  describe "POST /create" do
    it 'creates a cat' do
      cat_params = {
        cat: {
          name: 'Franklin',
          age: 5,
          hobbies: 'eating toilet paper',
          image: 'https://unsplash.com/photos/7DXQtl__9Cw'
        }
      }
      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name).to eq 'Franklin'
      expect(cat.age).to eq 5
      expect(cat.hobbies).to eq 'eating toilet paper'
    end
  end

  describe "PATCH /update/:id" do
    it 'updates a cat' do
      cat = Cat.create(
        name: 'Felix',
        age: 3,
        hobbies: 'chasing mice',
        image: 'https://example.com/cat.jpg'
      )

      updated_cat_params = {
        cat: {
          name: 'Whiskers',
          age: 4,
          hobbies: 'napping',
          image: 'https://example.com/whiskers.jpg'
        }
      }

      patch "/cats/#{cat.id}", params: updated_cat_params
      expect(response).to have_http_status(200)
      cat.reload
      expect(cat.name).to eq 'Whiskers'
      expect(cat.age).to eq 4
      expect(cat.hobbies).to eq 'napping'
    end
  end

  describe "DELETE /destroy/:id" do
    it 'deletes a cat' do
      cat = Cat.create(
        name: 'Mittens',
        age: 2,
        hobbies: 'playing with yarn',
        image: 'https://example.com/mittens.jpg'
      )

      delete "/cats/#{cat.id}"
      expect(response).to have_http_status(204)
      expect { cat.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
