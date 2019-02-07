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
    role = "Finance"
    assert_difference "Candidate.count" do
      post candidate_path, params: { candidate: {
        role: role,
        looking_for: "Sample looking for",
        highlights: "Sample highlights",
        LinkedIn: "https://www.linkedin.com",
        GitHub: "https://www.linkedin.com",
        Behance: "https://www.linkedin.com",
        Dribbble: "https://www.linkedin.com",
        Angellist: "https://www.linkedin.com",
        other: "https://www.linkedin.com",
        location: "Vancouver"
                                      }
                                  }
    end

    # Validate that bio was properly posted
    assert_redirected_to candidate_url
    follow_redirect!
    assert_match role, response.body

    # Delete post
    candidate_post = @user.candidate
    assert_difference 'Candidate.count', -1 do
      delete candidate_path(candidate_post)
    end

  end

  end