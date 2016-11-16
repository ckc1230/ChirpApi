require "rails_helper"

describe "Chirp API Tests" do
	it "GET /chirps should return 200" do
		get "/chirps"
		expect(response).to have_http_status(200)
	end

	it "GET /chirps/:id should return 200" do
		chirp = Chirp.create(content: "hello birds")

		get "/chirps/#{chirp.id}"

		expect(response).to have_http_status(200)
	end

	it "POST /chirps should return 201" do
		post "/chirps", params: {
			chirp: {
				content: "Whoopee, friends!"
			}
		}
		expect(response).to have_http_status(201)
	end

	it "EDIT /chirps/:id/edit should return 200" do
		chirp = Chirp.create(content: "hello birds")
		get "/chirps/#{chirp.id}/edit"

		expect(response).to have_http_status(200)
	end

	it "PUT /chirps/:id should return 204" do
		chirp = Chirp.create(content: "hello birds")

		put "/chirps/#{chirp.id}", params: {
			chirp: {
				content: "goodbye little birds"
			}
		}

		expect(response).to have_http_status(204)
	end

	it "DELETE /chirps/:id should return 204" do
		chirp = Chirp.create(content: "hello birds")

		delete "/chirps/#{chirp.id}"

		expect(response).to have_http_status(204)
	end


end