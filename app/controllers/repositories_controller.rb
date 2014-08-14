class RepositoriesController < ApplicationController
  def find
    repository = Repository.find_or_create_with_params(repository_params)
    if repository.persisted?
      redirect_to repository
    else
      redirect_to root_path, alert: repository.errors.full_messages.join(', ')
    end
  end

  def show
    @repository = Repository.where(id: params[:id]).includes(:contributors).first
    @hash = Gmaps4rails.build_markers(@repository.contributors.with_coordinates) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.github_name
      marker.infowindow render_to_string(:partial => "/contributors/info", :locals => { :object => user})
    end
    @contributors = @repository.contributors.without_coordinates
  end

  private

  def repository_params
    params.require(:repository).permit :name, :github_owner
  end
end
