# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @donations = current_user.donations
                             .preload(:donation_type)
                             .order(donated_at: :desc)
  end
end
