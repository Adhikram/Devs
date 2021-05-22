class CoursesController < ApplicationController
  before_action :authenticate_user!
  # GET /courses
  def index
    courses=Course.all
    render json: courses
  end

  # GET /courses/1
  def show
    courses=Course.find(params[:id])
    render json: courses
  end

  # POST /courses
  def create
    course = Course.new(course_params)
    if course.save
      render json: course, status: :created, location: course
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    course=Course.find(params[:id])
    if course.update(course_params)
      render json: course
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    render json:Course.find(params[:id])
    Course.find(params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_course
    #   @course = Course.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :limit, :details)
    end
  # end
end
