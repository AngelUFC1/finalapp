class TeamsController < ApplicationController
  def index
    @list_of_teams = Team.all.order({ :created_at => :desc })

    render({ :template => "team_templates/index" })
  end

  def show
    
    the_id = params.fetch("path_id")
    @the_team = Team.find(the_id)

    render({ :template => "team_templates/show" })
  end

  def create
    @the_team = Team.new
    @the_team.name = params.fetch("query_name")
    @the_team.titles = params.fetch("query_titles")
    @the_team.last_title = params.fetch("query_last_title")
    @the_team.history = params.fetch("query_history")
    @the_team.image = params.fetch("query_image")
    @the_team.coach_id = params.fetch("query_coach_id")

    if @the_team.valid?
      @the_team.save
      redirect_to("/teams", { :notice => "Team created successfully." })
    else
      redirect_to("/teams", { :notice => "Team failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_team = Team.find(the_id)

    @the_team.name = params.fetch("query_name")
    @the_team.titles = params.fetch("query_titles")
    @the_team.last_title = params.fetch("query_last_title")
    @the_team.history = params.fetch("query_history")
    @the_team.image = params.fetch("query_image")
    @the_team.coach_id = params.fetch("query_coach_id")

    if @the_team.valid?
      @the_team.save
      redirect_to("/teams/#{@the_team.id}", { :notice => "Team updated successfully."} )
    else
      redirect_to("/teams/#{@the_team.id}", { :alert => "Team failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_team = Team.find(the_id)

    @the_team.destroy

    redirect_to("/teams", { :notice => "Team deleted successfully."} )
  end

  def max_titles
    @most = Team.
      all.
      where.not({ :titles => nil }).
      order({ :titles => :desc }).
      at(0)

    render({ :template => "team_templates/most" })
  end

  def min_titles
    @least = Team.
      all.
      where.not({ :titles => nil }).
      order({ :titles => :asc }).
      at(0)

    render({ :template => "team_templates/least" })
  end
end
