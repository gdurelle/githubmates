class ContributorsController < ApplicationController
  before_filter :find_contributor

  def refresh_position
    @contributor.refresh_position
    redirect_to repository_path(params[:from])
  end

  private

  def find_contributor
    @contributor = Contributor.find(params[:id])
  end
end
