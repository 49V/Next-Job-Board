require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @candidate = candidates(:moshe)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Candidate.count' do
      post candidate_path, params: { job: { bio: "I grew up in the terrible small town of Prince George and I am trying to make a name for myself",
                                            portfolio: "www.linkedin.com/moshelawlor",
                                            role: "Tech",
                                            user: "michael" }}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Candidate.count' do
      candidate_path
      delete candidate_path(@candidate)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong candidate" do
    log_in_as(users(:michael))
    candidate_posting = candidates(:reza)
    assert_no_difference "Candidate.count" do
      delete candidate_path(candidate_posting)
    end
    assert_redirected_to root_url
  end

end
