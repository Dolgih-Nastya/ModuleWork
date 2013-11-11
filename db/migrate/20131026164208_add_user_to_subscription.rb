class AddUserToSubscription < ActiveRecord::Migration
  def change
    add_reference :subscriptions, :section
  end
end
