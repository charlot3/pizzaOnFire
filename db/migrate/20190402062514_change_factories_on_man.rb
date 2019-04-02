class ChangeFactoriesOnMan < ActiveRecord::Migration[5.1]
  def change
    add_column :factories, :transman, :integer
  end
end
