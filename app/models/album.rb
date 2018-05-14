# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  live       :boolean          default(TRUE), not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :band, :title, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: :band_id }
  validates :year, numericality: { minimum: 1900, maximum: 9000 }

  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band
end
