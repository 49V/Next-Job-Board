require 'test_helper'

class JobTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @job = @user.jobs.build(title: "Dev",
                   company: "Beans & Co.",
                   website: "www.beans.com",
                   link: "www.linkedin.com",
                   role: "Tech",
                   notes: "MEOW MEOW MEOW")
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

  test "notes should be at most 500 characters" do
    @job.notes = "A" * 501
    assert_not @job.valid?
  end

  test "order should be most recent first" do
    assert_equal jobs(:most_recent), Job.first
  end

end
