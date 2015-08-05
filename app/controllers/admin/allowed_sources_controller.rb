class Admin::AllowedSourcesController < ApplicationController
  def index
    @allowed_sources = AllowedSource.order(:octet1, :octet2, :octet3, :octet4)
  end
end