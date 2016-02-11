require 'test_helper'

class AoQuestionnaireControllerTest < ActionController::TestCase
  test "should get InstructorQuestionnaire" do
    get :InstructorQuestionnaire
    assert_response :success
  end

end
