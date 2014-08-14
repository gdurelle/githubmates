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
    @repository = Repository.find(params[:id])
  end

  private

  def repository_params
    params.require(:repository).permit :name, :github_owner
  end
end
