class InstructorsController < ApplicationController

  def index
  	@students = Student.all
  end

  # def show
  # 	id = params[:id]
  # 	@student = Student.find(id)
  # end

  # def edit
  # end

  # def update
  # end

end