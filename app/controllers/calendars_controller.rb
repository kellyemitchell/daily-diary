class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all.order({ :created_at => :desc })

    render({ :template => "calendars/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @calendar = Calendar.where({:id => the_id }).at(0)

    render({ :template => "calendars/show.html.erb" })
  end

  def create
    @calendar = Calendar.new
    @calendar.provider_id = params.fetch("provider_id_from_query")
    @calendar.date = params.fetch("date_from_query")
    @calendar.description = params.fetch("description_from_query")

    if @calendar.valid?
      @calendar.save
      redirect_to("/calendars", { :notice => "Calendar created successfully." })
    else
      redirect_to("/calendars", { :notice => "Calendar failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @calendar = Calendar.where({ :id => the_id }).at(0)

    @calendar.provider_id = params.fetch("provider_id_from_query")
    @calendar.date = params.fetch("date_from_query")
    @calendar.description = params.fetch("description_from_query")

    if @calendar.valid?
      @calendar.save
      redirect_to("/calendars/#{@calendar.id}", { :notice => "Calendar updated successfully."} )
    else
      redirect_to("/calendars/#{@calendar.id}", { :alert => "Calendar failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @calendar = Calendar.where({ :id => the_id }).at(0)

    @calendar.destroy

    redirect_to("/calendars", { :notice => "Calendar deleted successfully."} )
  end
end
