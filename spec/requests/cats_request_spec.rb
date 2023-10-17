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
    it "creates a cat" do
      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Solo',
          age: 2,
          hobbies: 'loves the scratching post',
          image: 'https://unsplash.com/photos/a-cat-sitting-on-t
          op-of-a-cat-tree-hgGZPMWaKjA'
        }
      }
      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name).to eq 'Solo'
    end
  end

    describe "PATCH /update" do
        it "updates an existing cat" do
        cat_params = {
            cat: {
                name: 'Solo',
                age: 2,
                hobbies: 'loves the scratching post',
                image: 'https://unsplash.com/photos/a-cat-sitting-on-top-of-a-cat-tree-hgGZPMWaKjA'
            }
         }

        post '/cats', params: cat_params
        cat = Cat.first

        updated_cat_params = {
            cat: {
                name: 'Solo',
                age: 3,
                hobbies: 'loves the scratching post',
                image: 'https://unsplash.com/photos/a-cat-sitting-on-top-of-a-cat-tree-hgGZPMWaKjA'
            }
        }

        patch '/cats/#{cat.id}', params: updated_cat_params
        updated_cat = cat.find(cat.id)

        expect(response).to have_http_status(200)
        expect(updated_cat.age).to eq 3
        end
    end
end
