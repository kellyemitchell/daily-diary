class ProvidersController < ApplicationController
  def index
    @providers = Provider.all.order({ :created_at => :desc })

    render({ :template => "providers/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @provider = Provider.where({:id => the_id }).at(0)

    render({ :template => "providers/show.html.erb" })
  end

  def create
    @provider = Provider.new
    @provider.name = params.fetch("name_from_query")
    @provider.admin_id = @current_user.id
    @provider.admin_name = @current_user.name
    @provider.location = params.fetch("location_from_query")
    @provider.description = params.fetch("description_from_query")

    if @provider.valid?
      @provider.save
    
      redirect_to("/providers/#{@provider.id}", { :notice => "Provider account created successfully." })
    else
      redirect_to("/providers", { :notice => "Provider account failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @provider = Provider.where({ :id => the_id }).at(0)

    @provider.name = params.fetch("name_from_query")
    @provider.admin_id = params.fetch("admin_id_from_query")
    @provider.location = params.fetch("location_from_query")
    @provider.description = params.fetch("description_from_query")

    if @provider.valid?
      @provider.save
      redirect_to("/providers/#{@provider.id}", { :notice => "Provider updated successfully."} )
    else
      redirect_to("/providers/#{@provider.id}", { :alert => "Provider failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @provider = Provider.where({ :id => the_id }).at(0)

    @provider.destroy

    redirect_to("/providers", { :notice => "Provider deleted successfully."} )
  end
end
