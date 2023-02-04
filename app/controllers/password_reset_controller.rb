class PasswordResetController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:email])

		if @user.present?
			PasswordMailer.with(user: @user).reset.deliver_later			
		else
			redirect_to root_path, notice: "if an account with that email was found, we have sent an email"
		end

	end

	def edit
		@user = User.find_signed(params[:token], purpose: "password_reset")
	rescue ActiveSupport::MessageVerifier::InvalidSignature
		redirect_to sign_in_path, alert: "Your token has expired" 
	end 

	def update
		@user = User.find_signed(params[:token],purpose: "password_reset")
		if @user.update(password_params)
			redirect_to sign_in_path , notice: "ypur password was rested"
		else
			render :edit , notice: "not reseted"

		end
	end

	private

	def password_params
		params.require(:user).permit(:password, :password_confirmation)
	end
end