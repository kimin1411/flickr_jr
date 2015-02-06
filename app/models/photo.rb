# require_relative '../uploader/uploader'

class Photo < ActiveRecord::Base
  # Remember to create a migration!
  mount_uploader :file, Uploader
  belongs_to :album
end
