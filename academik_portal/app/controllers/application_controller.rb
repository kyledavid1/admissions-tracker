class ApplicationController < ActionController::Base

		layout 'layout', :except => :index
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def current_user
		case session[:user_type]
		when 'Student' then Student.find_by(id: session[:user_id])
		when 'Instructor' then Instructor.find_by(id: session[:user_id])
		when 'AdmissionOfficer' then AdmissionOfficer.find_by(id: session[:user_id])
		end
		#need code here to indicate that the person currently logged in is a student
	end	

	def logout 
    	session.delete('user_id')
    	redirect_to '/'
  	end
end
