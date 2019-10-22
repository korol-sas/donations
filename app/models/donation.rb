# frozen_string_literal: true

class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :donation_type
end
