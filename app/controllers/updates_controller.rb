class UpdatesController < ApplicationController
  def index
    @updates = Update.all.order({ :created_at => :desc })

    render({ :template => "updates/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @update = Update.where({:id => the_id }).at(0)

    render({ :template => "updates/show.html.erb" })
  end

  def create
    provider = Provider.where({ :admin_id => @current_user.id }).pluck(:id).at(0)

    @update = Update.new
    @update.provider_id = provider
    @update.reminders = params.fetch("reminders_from_query")
    @update.meals_and_snacks = params.fetch("meals_and_snacks_from_query")
    @update.activities = params.fetch("activities_from_query")
    @update.date = params.fetch("date_from_query")
    

    if @update.valid?
      @update.save
      redirect_to("/photos", { :notice => "Update created successfully." })
    else
      redirect_to("/updates", { :notice => "Update failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @update = Update.where({ :id => the_id }).at(0)

    @update.provider_id = @current_user.my_business
    @update.reminders = params.fetch("reminders_from_query")
    @update.meals_and_snacks = params.fetch("meals_and_snacks_from_query")
    @update.activities = params.fetch("activities_from_query")
    @update.date = params.fetch("date_from_query")

    if @update.valid?
      @update.save
      redirect_to("/updates/#{@update.id}", { :notice => "Update updated successfully."} )
    else
      redirect_to("/updates/#{@update.id}", { :alert => "Update failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @update = Update.where({ :id => the_id }).at(0)

    @update.destroy

    redirect_to("/updates", { :notice => "Update deleted successfully."} )
  end
end
