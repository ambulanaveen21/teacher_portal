# app/controllers/students_controller.rb
class StudentsController < ApplicationController

  before_action :authenticate_teacher!
  before_action :set_student, only: %i[edit update destroy]

  def index
    @students = Student.page(params[:page]).per(10)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.find_or_initialize_by(name: student_params[:name], subject: student_params[:subject])
    @student.assign_attributes(student_params)

    flash_message = @student.persisted? ? "Student marks updated successfully." : "Student added successfully."

    if @student.save
      flash.now[:success] = flash_message
      respond_to do |format|
        format.html { redirect_to students_path, notice: flash.now[:success] }
        format.js
      end
    else
      flash.now[:error] = "There was an error saving the student. Please check your input."
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end


  def edit; end

  def update
    if @student.update(student_params)
      render json: { success: true, message: "Student updated successfully." }
    else
      render json: { success: false, message: @student.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    flash.now[:success] = "Student deleted successfully."
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :subject, :marks)
  end
end
