require "rails_helper"
RSpec.describe ContactsController, type: :controller do
   let(:user) { build_stubbed(:user) }

   before do
     sign_in_mock_user(user)
   end

   describe "Action" do
     describe "GET Index" do
         it "renders the index template" do
           #expect(:user).to receive(:role_id).and_return("admin")
           get :index
           expect(response).to render_template("index")
         end
     end
   end

end
