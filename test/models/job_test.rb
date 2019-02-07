require 'test_helper'

class JobTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @job = @user.jobs.build(
      title: "Dog Cuddler",
      company: "Sadie & Co.",
      website: "www.sadiehopkins.com",
      link: "www.linkedin.com/snades",
      role: "Technical",
      elevator_pitch: "Sample elevator pitch",
      why_get_excited: "Why get excited",
      description: "Sample job description",
      location: "Toronto"
    )
  end

  test "should be valid" do
    assert @job.valid?
  end

  test "user id should be present" do
    @job.user_id = nil
    assert_not @job.valid?
  end

  test "title should be present" do
    @job.title = nil
    assert_not @job.valid?
  end

  test "company should be present" do
    @job.company = nil
    assert_not @job.valid?
  end

  test "link to job should be present" do
    @job.link = nil
    assert_not @job.valid?
  end

  test "role should be present" do
    @job.role = nil
    assert_not @job.valid?
  end

  test "order should be most recent first" do
    assert_equal jobs(:most_recent), Job.first
  end

end
