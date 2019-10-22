# frozen_string_literal: true

class DonationType < ApplicationRecord
  has_many :donations

  validates_presence_of :name
end
