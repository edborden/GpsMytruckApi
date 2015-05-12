class SessionsController < AuthenticatedController
	skip_before_action :ensure_authenticated_user, only: :create

	def create
		user = User.find_by_email params[:session][:email]
		if user
			if user.authenticate params[:session][:password]
				user.session.try(:destroy)
				render json: user.create_session
			else
				error = {errors: {password: ["Incorrect password."]}}
				render json: error, status: 422
			end
		else
			error = {errors: {email: ["We don't have a user with that email address."]}}
			render json: error, status: 422
		end
	end

	def index
		render json: [current_session]
	end

	def destroy
		current_session.destroy
		head :no_content
	end

end