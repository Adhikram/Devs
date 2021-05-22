class EnrollsController < ApplicationController
  before_action :set_enroll, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /enrolls
  def index
    @enrolls = Enroll.all
    render json: @enrolls
  end

  # GET /enrolls/1
  def show
    render json: @enroll
  end
# put/enrolls/course
  def studentEnroll
    course= Course.find(params[:course_id])
    users= course.users
    output = Hash.new
    users.each do |key, value|
      output[key] = value
    end
    render json: course.to_json(:include => { :users => output })
  end
# put/enrolls/student
  def courseEnroll
    user = User.find(params[:user_id])
    courses = user.courses
    output = Hash.new
    courses.each do |key, value|
      output[key] = value
    end
    render json: user.to_json(:include => { :courses => output })

  end

  # put/enrolls/1
  def deenrollment 
    @enroll = Enroll.find(params[:id])
    render json: @enroll
    @enroll.destroy
  end
  # put/enrolls/1
  def enrollment
    if Course.find(params[:course_id]).limit == Course.find(params[:course_id]).users.count || User.find(current_user.id).courses.exists?(Course.find(params[:course_id]).id)
      if User.find(current_user.id).courses.exists?(Course.find(params[:course_id]).id)
        render json: "Already addded to the course" 
      else
        render json: "Course limit has reached" 
      end
    else
      @enroll = Enroll.create(user_id:current_user.id, course_id:params[:course_id])
      render json: @enroll
    end
end
  # end

  # POST /enrolls
  def create
    params.require(:enroll).permit(:user_id, :course_id)
    @enroll = Enroll.create(user_id:params[:user_id], course_id:params[:course_id])
    # @enroll=Enroll.crear(user_id:,course_id:params[:course_id])
    render json:@enroll  
    
  end

  # PATCH/PUT /enrolls/1
  def update
    if @enroll.update(enroll_params)
      render json: @enroll
    else
      render json: @enroll.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enrolls/1
  def destroy
    @enroll.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enroll
      @enroll = Enroll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enroll_params
      params.require(:enroll).permit(:user_id, :course_id)
    end
end
