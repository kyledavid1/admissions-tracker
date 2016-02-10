class CreateAdmissionsOfficersQuestionnaire < ActiveRecord::Migration
  def change
    create_table :admissions_officers_questionnaires do |t|
      t.text :course_goals
      t.text :comments
      t.text :reason_for_applying
    end
  end
end
