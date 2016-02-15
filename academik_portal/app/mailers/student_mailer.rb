class StudentMailer < ApplicationMailer

	   default from: 'testmailinrains@gmail.com'
   
   def welcome_email(student)
      @student = student
      @url  = 'http://www.generalassemb.ly'
      mail(to: @student.email, subject: 'Thanks for applying to General Assembly!')
   end
end
