class DirectMessagesController < ApplicationController
  def index
    @direct_messages = DirectMessage.all.order({ :created_at => :desc })

    render({ :template => "direct_messages/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @direct_message = DirectMessage.where({:id => the_id }).at(0)

    render({ :template => "direct_messages/show.html.erb" })
  end

  def create
    @direct_message = DirectMessage.new
    @direct_message.sender_id = params.fetch("sender_id_from_query")
    @direct_message.receiver_id = params.fetch("receiver_id_from_query")
    @direct_message.body = params.fetch("body_from_query")

    if @direct_message.valid?
      @direct_message.save
      redirect_to("/direct_messages", { :notice => "Direct message created successfully." })
    else
      redirect_to("/direct_messages", { :notice => "Direct message failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @direct_message = DirectMessage.where({ :id => the_id }).at(0)

    @direct_message.sender_id = params.fetch("sender_id_from_query")
    @direct_message.receiver_id = params.fetch("receiver_id_from_query")
    @direct_message.body = params.fetch("body_from_query")

    if @direct_message.valid?
      @direct_message.save
      redirect_to("/direct_messages/#{@direct_message.id}", { :notice => "Direct message updated successfully."} )
    else
      redirect_to("/direct_messages/#{@direct_message.id}", { :alert => "Direct message failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @direct_message = DirectMessage.where({ :id => the_id }).at(0)

    @direct_message.destroy

    redirect_to("/direct_messages", { :notice => "Direct message deleted successfully."} )
  end
end
