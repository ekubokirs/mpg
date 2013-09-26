module Features
	module SessionHelpers
		def sign_in
			user = User.create(email: "emilia@gmail.com", password: "123", password_confirmation: "123")
			visit login_path
			fill_in "E-mail", with: user.email
			fill_in "password", with: user.password
			click_button "Sign In"
		end
	end
end