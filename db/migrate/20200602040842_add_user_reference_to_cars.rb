class AddUserReferenceToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :user, null: true, default: nil, foreign_key: true
  end
end
