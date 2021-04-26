class CreateTransformers < ActiveRecord::Migration[5.1]
  def change
    create_table :transformers do |t|
      t.string :name
      t.string :alternate_form
      t.string :team
    end
  end
end
