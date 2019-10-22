# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @donations = current_user.donations
  end
end
