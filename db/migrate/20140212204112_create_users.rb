class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float :usd
      t.float :btc
      t.float :last_rate

      t.timestamps
    end
  end
end
