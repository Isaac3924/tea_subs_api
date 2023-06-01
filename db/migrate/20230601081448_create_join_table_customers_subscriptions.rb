class CreateJoinTableCustomersSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_join_table :customers, :subscriptions do |t|
      t.index [:customer_id, :subscription_id]
      t.index [:subscription_id, :customer_id]
    end
  end
end
