json.array!(@students) do |student|
  json.extract! user, :name, :email, :phone_number, :password, :application_essay, application_status
  json.url student_url(student, format: :json)
end
