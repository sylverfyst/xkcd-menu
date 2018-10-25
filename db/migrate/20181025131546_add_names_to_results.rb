class AddNamesToResults < ActiveRecord::Migration[5.2]
  def change
  	add_column :results, :names, :string, array:true, default: [] 
  end
end
