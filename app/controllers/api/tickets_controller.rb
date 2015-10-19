class API::TicketsController < ApplicationController
  attr_reader :current_user
  before_action :set_project
  before_action :authenticate_user

  def show
    @ticket = @project.tickets.find(params[:id])
    authorize @ticket, :show?
    render json: @ticket
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  private

  def authenticate_user
    authenticate_with_http_token do |token|
      @current_user = User.find_by(api_key: token)
    end
  end

end
