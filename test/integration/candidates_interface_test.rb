require 'test_helper'

class CandidatesInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:lana)
  end

  test "candidate interface" do
    log_in_as(@user)
    get candidate_path

    # Invalid submission
    assert_no_difference "Candidate.count" do
      post candidate_path, params: { candidate: { bio: "",
                                                  portfolio: "",
                                                  role: ""
                                                }
                                    }
    end

    # Valid submission
    bio = "Impressionist"
    assert_difference "Candidate.count" do
      post candidate_path, params: { candidate: {
                                       bio: bio,
                                       portfolio: "https://www.linkedin.com/in/moshelawlor/",
                                       role: "Tech"
                                      }
                                  }
    end

    # Validate that bio was properly posted
    assert_redirected_to candidate_url
    follow_redirect!
    assert_match bio, response.body

    # Delete post
    candidate_post = @user.candidate
    assert_difference 'Candidate.count' do
      delete candidate_path(candidate_post)
    end

  end

  end