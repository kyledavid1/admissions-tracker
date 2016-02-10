class CreateInstructorsQuestionnaire < ActiveRecord::Migration
  def change
    create_table :instructors_questionnaires do |t|
      t.text :strengths
      t.text :weaknesses
      t.boolean :good_fit
      t.text :comments
    end
  end
end
