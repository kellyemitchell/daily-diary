Rails.application.routes.draw do

  #Dashboard routes

  match("/", { :controller => "application", :action => "index", :via => "get"})

  # Routes for the Direct message resource:

  # CREATE
  match("/insert_direct_message", { :controller => "direct_messages", :action => "create", :via => "post"})
          
  # READ
  match("/direct_messages", { :controller => "direct_messages", :action => "index", :via => "get"})
  
  #match("/direct_messages/:id_from_path", { :controller => "direct_messages", :action => "show", :via => "get"})
  
  # UPDATE
  
  #match("/modify_direct_message/:id_from_path", { :controller => "direct_messages", :action => "update", :via => "post"})
  
  # DELETE
  #match("/delete_direct_message/:id_from_path", { :controller => "direct_messages", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Calendar resource:

  # CREATE
  #match("/insert_calendar", { :controller => "calendars", :action => "create", :via => "post"})
          
  # READ
  #match("/calendars", { :controller => "calendars", :action => "index", :via => "get"})
  
  #match("/calendars/:id_from_path", { :controller => "calendars", :action => "show", :via => "get"})
  
  # UPDATE
  
  #match("/modify_calendar/:id_from_path", { :controller => "calendars", :action => "update", :via => "post"})
  
  # DELETE
  #match("/delete_calendar/:id_from_path", { :controller => "calendars", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  match("/insert_photo", { :controller => "photos", :action => "create", :via => "post"})
          
  # READ
  match("/photos", { :controller => "photos", :action => "index", :via => "get"})
  
  #match("/photos/:id_from_path", { :controller => "photos", :action => "show", :via => "get"})
  
  # UPDATE
  
  #match("/modify_photo/:id_from_path", { :controller => "photos", :action => "update", :via => "post"})
  
  # DELETE
  #match("/delete_photo/:id_from_path", { :controller => "photos", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Update resource:

  # CREATE
  match("/insert_update", { :controller => "updates", :action => "create", :via => "post"})
          
  # READ
  match("/updates", { :controller => "updates", :action => "index", :via => "get"})
  
  match("/updates/:id_from_path", { :controller => "updates", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_update/:id_from_path", { :controller => "updates", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_update/:id_from_path", { :controller => "updates", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Enrollment resource:

  # CREATE
  match("/insert_enrollment", { :controller => "enrollments", :action => "create", :via => "post"})
          
  # READ
  match("/enrollments", { :controller => "enrollments", :action => "index", :via => "get"})
  
  #match("/enrollments/:id_from_path", { :controller => "enrollments", :action => "show", :via => "get"})
  
  # UPDATE
  
  #match("/modify_enrollment/:id_from_path", { :controller => "enrollments", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_enrollment/:parent_from_path", { :controller => "enrollments", :action => "destroy", :via => "get"})

  match("/unsubscribe/:id_from_path", { :controller => "enrollments", :action => "unsubscribe", :via => "get"})

  #------------------------------

  # Routes for the Provider resource:

  # CREATE
  match("/insert_provider", { :controller => "providers", :action => "create", :via => "post"})
          
  # READ
  match("/providers", { :controller => "providers", :action => "index", :via => "get"})
  
  #match("/providers/:id_from_path", { :controller => "providers", :action => "show", :via => "get"})
  
  # UPDATE
  
  #match("/modify_provider/:id_from_path", { :controller => "providers", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_provider/:id_from_path", { :controller => "providers", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for signing up

  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})
  
  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_user", { :controller => "users", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_user", { :controller => "users", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})


  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
