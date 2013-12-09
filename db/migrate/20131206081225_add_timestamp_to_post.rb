class AddTimestampToPost < ActiveRecord::Migration
  def change
    add_timestamps(:users)
    add_timestamps(:posts)
    add_timestamps(:categories)
    add_timestamps(:post_categories)
    add_timestamps(:comments)

  end
end
