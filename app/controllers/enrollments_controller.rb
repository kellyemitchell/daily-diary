class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all.order({ :created_at => :desc })

    render({ :template => "enrollments/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @enrollment = Enrollment.where({:id => the_id }).at(0)

    render({ :template => "enrollments/show.html.erb" })
  end

  def create
    @enrollment = Enrollment.new
    @enrollment.provider_id = params.fetch("provider_id_from_query")
    @enrollment.parent_id = params.fetch("parent_id_from_query")
    @enrollment.accepted = params.fetch("accepted_from_query", false)

    if @enrollment.valid?
      @enrollment.save
      redirect_to("/enrollments", { :notice => "Enrollment created successfully." })
    else
      redirect_to("/enrollments", { :notice => "Enrollment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @enrollment = Enrollment.where({ :id => the_id }).at(0)

    @enrollment.provider_id = params.fetch("provider_id_from_query")
    @enrollment.parent_id = params.fetch("parent_id_from_query")
    @enrollment.accepted = params.fetch("accepted_from_query", false)

    if @enrollment.valid?
      @enrollment.save
      redirect_to("/enrollments/#{@enrollment.id}", { :notice => "Enrollment updated successfully."} )
    else
      redirect_to("/enrollments/#{@enrollment.id}", { :alert => "Enrollment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @enrollment = Enrollment.where({ :id => the_id }).at(0)

    @enrollment.destroy

    redirect_to("/enrollments", { :notice => "Enrollment deleted successfully."} )
  end
end
