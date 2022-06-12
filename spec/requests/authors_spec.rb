require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /authors" do

    before do
      ["Jason Wallace", "Rosan Hollak", "Nanna Foss"].each do |name|
        Author.create(name: name)
      end
    end

    it "returns authors" do
      get authors_path
      expect(response).to have_http_status(200)
    end
  end
end
