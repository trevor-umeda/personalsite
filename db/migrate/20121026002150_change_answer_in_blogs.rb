class ChangeAnswerInBlogs < ActiveRecord::Migration
  def up
      change_column :questions, :answer, :text
  end
  def down
      # This might cause trouble if you have strings longer
      # than 255 characters.
      change_column :questions, :answer, :string
  end
end
