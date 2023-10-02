class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    # A chamada para create_table especifica como o articles table deve ser construido
    # - create_table method add an id column an an auto-incrementing primary key.
    create_table :articles do |t|
      t.string :title
      t.text :body

      # This method defines two additional columns named created_at and updated_at
      t.timestamps
    end
  end
end
