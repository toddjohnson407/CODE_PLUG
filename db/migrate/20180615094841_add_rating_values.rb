class AddRatingValues < ActiveRecord::Migration[5.2]
  def change
    Course.all.each do |course|
      course.rate = (1..5).to_a.sample
      course.save
    end
  end
end
