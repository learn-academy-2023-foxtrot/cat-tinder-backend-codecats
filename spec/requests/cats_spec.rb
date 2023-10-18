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
end
