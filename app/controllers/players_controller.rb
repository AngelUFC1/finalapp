class PlayersController < ApplicationController
  def index
    @list_of_players = Player.all.order({ :created_at => :desc })

    render({ :template => "player_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_player = Player.where({:id => the_id }).at(0)
    
    render({ :template => "player_templates/show" })
  end

  def create
    @the_player = Player.new
    @the_player.name = params.fetch("query_name")
    @the_player.dob = params.fetch("query_dob")
    @the_player.bio = params.fetch("query_bio")
    @the_player.image = params.fetch("query_image")

    if @the_player.valid?
      @the_player.save
      redirect_to("/players", { :notice => "Player created successfully." })
    else
      redirect_to("/players", { :notice => "Player failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_player = Player.where({ :id => the_id }).at(0)

    @the_player.name = params.fetch("query_name")
    @the_player.dob = params.fetch("query_dob")
    @the_player.bio = params.fetch("query_bio")
    @the_player.image = params.fetch("query_image")

    if @the_player.valid?
      @the_player.save
      redirect_to("/players/#{@the_player.id}", { :notice => "Player updated successfully."} )
    else
      redirect_to("/players/#{@the_player.id}", { :alert => "Player failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_player = Player.where({ :id => the_id }).at(0)

    @the_player.destroy

    redirect_to("/players", { :notice => "Player deleted successfully."} )
  end
end
