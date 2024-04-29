# frozen_string_literal: true

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string  :username
    t.string  :email
    t.string  :first_name
    t.string  :last_name
    t.integer :post_id

    t.timestamps null: false
  end
end
