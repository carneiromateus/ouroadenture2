class CreateJoinTableNewsDirector < ActiveRecord::Migration[5.0]
  def change
    create_join_table :news, :directors do |t|
      	t.index [:news_id, :director_id]
      # t.index [:director_id, :news_id]
    end
  end
end
