class AddInitialDataToArticles < ActiveRecord::Migration[6.0]
  def change
  	def up
    5.times do |i|
      Article.create(title: "title ##{i}", text: "text for article ##{i}")
    end
  end
 
  def down
    Article.delete_all
  end
  end
end
