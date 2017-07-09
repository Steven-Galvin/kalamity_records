class PagesController < ApplicationController
  def home
    @records = Record.most_reviewed
  end
end
