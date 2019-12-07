class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("email_from_query")
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query")
    @user.name = params.fetch("name_from_query")
    @user.child_name = params.fetch("child_name_from_query")
    @user.provider = params.fetch("provider_from_query", false)

    save_status = @user.save

    if save_status == true
      session.store(:user_id,  @user.id)
   
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("email_from_query")
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query")
    @user.name = params.fetch("name_from_query")
    @user.child_name = params.fetch("child_name_from_query")
    @user.provider = params.fetch("provider_from_query", false)
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
  
end
