require "rails_helper"


RSpec.describe EggsController, :type => :controller do

    login_user

    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:egg) { Egg.create(title: "Test title", game: "Test Game Name") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end

        context "GET #new" do
            it "returns a success response" do
                get :new
                expect(response).to have_http_status(:ok)
            end
        end

        context "POST #create" do
            it "create new egg" do
                expect {
                    post :create, params: { egg: {title: 'Test Title', game: 'Test Game Name'}}
                }.to change {Egg.count}.from(0).to(1)
            end
        end
    end
end
