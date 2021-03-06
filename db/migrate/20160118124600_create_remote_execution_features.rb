class CreateRemoteExecutionFeatures < ActiveRecord::Migration
  def change
    create_table :remote_execution_features do |t|
      t.string :label, :index => true, :null => false
      t.string :name, :null => false
      t.string :description
      t.text :provided_inputs
      t.integer :job_template_id
    end
    add_index :remote_execution_features, :label
    add_index :remote_execution_features, :job_template_id
    add_foreign_key :remote_execution_features, :templates, :column => :job_template_id
  end
end
