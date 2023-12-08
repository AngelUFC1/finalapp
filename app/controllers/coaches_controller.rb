class CoachesController < ApplicationController
  def index
    @list_of_coaches = Coach.all.order({ :created_at => :desc })

    render({ :template => "coach_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_coach = Coach.find(the_id)

    render({ :template => "coach_templates/show" })
  end

  def create
    @the_coach = Coach.new
    @the_coach.name = params.fetch("query_name")
    @the_coach.dob = params.fetch("query_dob")
    @the_coach.bio = params.fetch("query_bio")
    @the_coach.image = params.fetch("query_image")

    if @the_coach.valid?
      @the_coach.save
      redirect_to("/coaches", { :notice => "Coach created successfully." })
    else
      redirect_to("/coaches", { :notice => "Coach failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_coach = Coach.find(the_id)

    @the_coach.name = params.fetch("query_name")
    @the_coach.dob = params.fetch("query_dob")
    @the_coach.bio = params.fetch("query_bio")
    @the_coach.image = params.fetch("query_image")

    if @the_coach.valid?
      @the_coach.save
      redirect_to("/coaches/#{@the_coach.id}", { :notice => "Coach updated successfully."} )
    else
      redirect_to("/coaches/#{@the_coach.id}", { :alert => "Coach failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_coach = Coach.find(the_id)

    @the_coach.destroy

    redirect_to("/coaches", { :notice => "Coach deleted successfully."} )
  end

  def max_dob
    @youngest = Coach.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc }).
      at(0)

    render({ :template => "coach_templates/youngest" })
  end

  def min_dob
    @eldest = Coach.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc }).
      at(0)

    render({ :template => "coach_templates/eldest" })
  end
end
