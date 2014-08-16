class RepositoriesController < ApplicationController
  before_filter :find_repository, only: %w(show refresh)

  def find
    repository = Repository.find_or_create_with_params(repository_params)
    if repository.persisted?
      redirect_to repository
    else
      redirect_to root_path, alert: repository.errors.full_messages.join(', ')
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@repository.contributors.with_coordinates) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.github_name
      marker.infowindow render_to_string(:partial => "/contributors/info", :locals => { :object => user})
    end
    @contributors = @repository.contributors.without_coordinates
  end

  def refresh
    @repository.fill_with_github
    redirect_to repository_path(params[:id])
  end

  private

  def find_repository
    @repository = Repository.find(params[:id])
  end

  def repository_params
    params.require(:repository).permit :name, :github_owner
  end
end
