class WelcomeController < ApplicationController
  def index
  end
  def load
    require 'csv'
    csv_text = File.read('/home/ubuntu/workspace/app/models/MOCK_DATA.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Person.create!(row.to_hash)
    end
  end
end
