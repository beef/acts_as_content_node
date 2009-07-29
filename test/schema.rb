ActiveRecord::Schema.define(:version => 0) do
  create_table :content_nodes, :force => true do |t|
    t.string   :title
    t.string   :permalink
    t.string   :description
    t.text     :body
    t.datetime :published_at
    t.datetime :published_to
    t.datetime :created_at
    t.datetime :updated_at
    t.references :updated_by, :created_by
  end
  
  create_table :users, :force => true do |t|
    t.string   :name
    t.string   :permalink
  end
end