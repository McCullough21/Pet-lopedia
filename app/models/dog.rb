# frozen_string_literal: true

class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :breed
  validates_presence_of :name, :breed
end
