class Delivery < ApplicationRecord
  belongs_to :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
  
end
