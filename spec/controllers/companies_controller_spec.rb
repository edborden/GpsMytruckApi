describe CompaniesController do

	describe "POST to #report" do

		before do 
			post :report
		end

		it { should respond_with :no_content }

	end

end