#Students.destroy_all
#Instructors.destroy_all
#AdmissionsOfficers.destroy_all
# InstructorsQuestionnaires.destroy_all
# AoQuestionnaires.destroy_all

30.times do |student|
	Students.create(
       name: Faker::Name.name,
       email: Faker::Internet.free_email,
       password_digest: Faker::Lorem.word,
       course: ["WDI", "UXDI", "PMI"].sample,    
       application_essay: Faker::Lorem.paragraph,
       application_status: "Phone Interview: Pending"
		)end




15.times do |instructor|
	Instructors.create(
       name: Faker::Name.name,
       email: Faker::Internet.safe_email,
       password_digest: Faker::Lorem.word,
       course: ["WDI", "UXDI", "PMI"].sample    
		)end


15.times do |ao_officer|
    AdmissionsOfficers.create(
        name: Faker::Name.name,
        email: Faker::Internet.safe_email,
        password_digest: Faker::Lorem.word
    	)end	








15.times do |iq|
	InstructorsQuestionnaires.create(
		strengths: Faker::Hipster.sentence(8),
		weaknesses: Faker::Hipster.sentence(5),
		good_fit: boolean,
		comments: Faker::Hipster.sentence(15)
       )end


 15.times do |ao_ques|
 AoQuestionnaires.create(
	 course_goals: Faker::Hipster.sentence(10),
	 comments: Faker::Hipster.sentence(10),
	 reason_for_applying: Faker::Hipster.sentence(10)
       )end