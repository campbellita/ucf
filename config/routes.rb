Rails.application.routes.draw do
  # Routes for the Ask_letter resource:
  # CREATE
  get "/ask_letters/new", :controller => "ask_letters", :action => "new"
  post "/create_ask_letter", :controller => "ask_letters", :action => "create"

  # READ
  get "/ask_letters", :controller => "ask_letters", :action => "index"
  get "/ask_letters/:id", :controller => "ask_letters", :action => "show"

  # UPDATE
  get "/ask_letters/:id/edit", :controller => "ask_letters", :action => "edit"
  post "/update_ask_letter/:id", :controller => "ask_letters", :action => "update"

  # DELETE
  get "/delete_ask_letter/:id", :controller => "ask_letters", :action => "destroy"
  #------------------------------

  # Routes for the Thank_you_letter resource:
  # CREATE
  get "/thank_you_letters/new", :controller => "thank_you_letters", :action => "new"
  post "/create_thank_you_letter", :controller => "thank_you_letters", :action => "create"

  # READ
  get "/thank_you_letters", :controller => "thank_you_letters", :action => "index"
  get "/thank_you_letters/:id", :controller => "thank_you_letters", :action => "show"

  # UPDATE
  get "/thank_you_letters/:id/edit", :controller => "thank_you_letters", :action => "edit"
  post "/update_thank_you_letter/:id", :controller => "thank_you_letters", :action => "update"

  # DELETE
  get "/delete_thank_you_letter/:id", :controller => "thank_you_letters", :action => "destroy"
  #------------------------------

  # Routes for the Check resource:
  # CREATE
  get "/checks/new", :controller => "checks", :action => "new"
  post "/create_check", :controller => "checks", :action => "create"

  # READ
  get "/checks", :controller => "checks", :action => "index"
  get "/checks/:id", :controller => "checks", :action => "show"

  # UPDATE
  get "/checks/:id/edit", :controller => "checks", :action => "edit"
  post "/update_check/:id", :controller => "checks", :action => "update"

  # DELETE
  get "/delete_check/:id", :controller => "checks", :action => "destroy"
  #------------------------------

  # Routes for the Grant resource:
  # CREATE
  get "/grants/new", :controller => "grants", :action => "new"
  post "/create_grant", :controller => "grants", :action => "create"

  # READ
  get "/grants", :controller => "grants", :action => "index"
  get "/grants/:id", :controller => "grants", :action => "show"

  # UPDATE
  get "/grants/:id/edit", :controller => "grants", :action => "edit"
  post "/update_grant/:id", :controller => "grants", :action => "update"

  # DELETE
  get "/delete_grant/:id", :controller => "grants", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Organization resource:
  # CREATE
  get "/organizations/new", :controller => "organizations", :action => "new"
  post "/create_organization", :controller => "organizations", :action => "create"

  # READ
  get "/organizations", :controller => "organizations", :action => "index"
  get "/organizations/:id", :controller => "organizations", :action => "show"

  # UPDATE
  get "/organizations/:id/edit", :controller => "organizations", :action => "edit"
  post "/update_organization/:id", :controller => "organizations", :action => "update"

  # DELETE
  get "/delete_organization/:id", :controller => "organizations", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
