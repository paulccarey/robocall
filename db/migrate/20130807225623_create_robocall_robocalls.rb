class CreateRobocallRobocalls < ActiveRecord::Migration
  def change
    create_table :robocall_robocalls do |t|
      t.string :token
      t.text :xml

      t.timestamps
    end
  end
end
