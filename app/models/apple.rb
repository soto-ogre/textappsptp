class Apple < ApplicationRecord
  include ActiveModel::Model
  # mount_uploaders :pictures, PicturesUploader
  serialize :pictures, JSON
  has_one :delivery
  validates_presence_of :name,:pictures,:discription, :condition
  accepts_nested_attributes_for :delivery
end
