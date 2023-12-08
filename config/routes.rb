Rails.application.routes.draw do
  # devise_for :users
  # root "pages#index"
  
  get("/", { :controller => "misc", :action => "homepage" })

  get("/coaches/youngest", { :controller => "coaches", :action => "max_dob" })
  get("/coaches/eldest", { :controller => "coaches", :action => "min_dob" })

  get("/coaches", { :controller => "coaches", :action => "index" })
  post("/insert_coach", { :controller => "coaches", :action => "create" })
  get("/coaches/:path_id", { :controller => "coaches", :action => "show" })
  post("/modify_coach/:path_id", { :controller => "coaches", :action => "update" })
  get("/delete_coach/:path_id", { :controller => "coaches", :action => "destroy" })

  get("/teams", { :controller => "teams", :action => "index" })
  post("/insert_team", { :controller => "teams", :action => "create" })
  get("/teams/:path_id", { :controller => "teams", :action => "show" })
  post("/modify_team/:path_id", { :controller => "teams", :action => "update" })
  get("/delete_team/:path_id", { :controller => "teams", :action => "destroy" })
  
  get("/players", { :controller => "players", :action => "index" })
  post("/insert_player", { :controller => "players", :action => "create" })
  get("/players/:path_id", { :controller => "players", :action => "show" })
  post("/modify_player/:path_id", { :controller => "players", :action => "update" })
  get("/delete_player/:path_id", { :controller => "players", :action => "destroy" })
  
end
