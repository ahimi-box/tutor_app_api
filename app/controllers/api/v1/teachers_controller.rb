class Api::V1::TeachersController < ApplicationController

  def teacher_index
    teachers = Teacher.where(admin: nil).joins(:subjects).select(:id, :name, :email, :introduction, :teacher_icon, :subject).order(:id)
    render json: teachers, status: 200
  end

  def update
    teacher = Teacher.find(params[:id])
    # subject = Subject.find_by(params[:teacher_id])
    # if subject.update(subject_params) && teacher.update(teacher_params)
    if teacher.update(teacher_params)
      render json: teacher, status: 200
    else
      render json: teacher, status: 500
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    if teacher.destroy
      render json: teacher, status: 200
    else
      render json: teacher, status: 500
    end
  end

  private

    def teacher_params
      params.require(:teacher).permit(:id, :name, :email, :introduction, :teacher_icon, subjects_attributes: [:id, :subject, :_destroy])
    end

    # def subject_params
    #   params.permit(:id, :subject)
    # end

end