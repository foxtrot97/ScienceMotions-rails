class ChemistryController < ApplicationController

  def indicators
    @chemistrys = Lesson.all
  end
  def periodictable
    @chemistrys = Lesson.all
  end

  def show
    @completed_lessons = @lesson.completed_lessons.all
    @completed_lesson = @lesson.completed_lessons.build
  end

  def create
    @completed_lesson = CompletedLesson.new(completed_lesson_params)
    @completed_lesson.user = current_user
    @completed_lesson.save

    respond_to do |format|

      if @completed_lesson.save
        format.html { redirect_to @completed_lesson, notice: 'Completed lesson was successfully created.' }
        format.json { render :show, status: :created, location: @completed_lesson }
      else
        format.html { render :new }
        format.json { render json: @completed_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_completed_lesson
    @completed_lesson = CompletedLesson.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def completed_lesson_params
    params.require(:completed_lesson).permit(:lesson_id, :user_id, :completed)
  end

end
