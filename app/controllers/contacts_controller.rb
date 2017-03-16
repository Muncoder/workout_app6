class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.create(contact_params)


		if @contact.save
			name = params[:contact][:name]
			email = params[:contact][:email]
			body = params[:contact][:body]
			
			ContactMailer.contact_mail(name, email, body).deliver

			flash[:notice] = "Contact sent successfully"
			redirect_to root_path
		else
			render "new"
		end
	end

	private

		def contact_params
			params.require(:contact).permit(:name, :email, :body)
		end

end