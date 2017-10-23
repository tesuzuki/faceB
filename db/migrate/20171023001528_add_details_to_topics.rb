class AddDetailsToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :title, :string

    add_column :topics, :user_id, :integer
    
    add_column :topics, :content, :string

  end
end
