require "rails_helper"

describe "Chirp API Tests" do
	it "GET /chirps should return 200" do
		get "/chirps"
		expect(response).to have_http_status(200)
	end

	it "GET /chirps/:id should return 200" do
		post "/chirps", params: {
			chirp: {
				content: "Yay friends!"
			}
		}
		get "/chirps/1"

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

	it "DELETE /chirps/:id should return 204" do
		post "/chirps", params: {
			chirp: {
				content: "Yay friends!"
			}
		}
		delete "/chirps/1"

		expect(response).to have_http_status(204)
	end


end