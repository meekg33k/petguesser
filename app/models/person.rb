class Person < ActiveRecord::Base
    validates :name, presence: false
    validates :height, :numericality => { :greater_than => 3, :less_than_or_equal_to => 8}, presence: true
    validates :weight, :numericality => { :greater_than => 70, :less_than_or_equal_to => 300}, presence: true
end
