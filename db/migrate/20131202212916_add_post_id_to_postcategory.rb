class AddPostIdToPostcategory < ActiveRecord::Migration
  def change
    add_column :PostCategory, :post_id, :integer
    add_column :PostCategory, :category_id , :integer
  end
  
end
