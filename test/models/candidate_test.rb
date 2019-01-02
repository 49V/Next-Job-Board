require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @candidate = @user.build_candidate(bio: "Motivated Entrepreneur",
                                       name: "Moshe Lawlor",
                                       portfolio: "https://www.linkedin.com/in/moshelawlor/",
                                       role: "Tech",
                                       user_id: @user.id)
  end

  test "should be valid" do
    assert @candidate.valid?
  end

  test "user id should be present" do
    @candidate.user_id = nil
    assert_not @candidate.valid?
  end

  test "bio should be at most 1000 characters" do
    @candidate.bio = "a" * 1001
    assert_not @candidate.valid?
  end

  test "associated candidate should be destroyed" do
    @user.save
    assert_difference 'Candidate.count', -1 do
      @user.destroy
    end
  end

end
