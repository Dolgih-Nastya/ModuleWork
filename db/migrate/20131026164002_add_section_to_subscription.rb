class AddSectionToSubscription < ActiveRecord::Migration
  def change
    add_reference :subscriptions, :user
  end
end
