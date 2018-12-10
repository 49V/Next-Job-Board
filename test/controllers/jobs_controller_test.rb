require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @job = jobs(:sadie)
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Job.count' do
      post jobs_path, params: { job: {title: "Developer",
                                      company: "Beans & Co.",
                                      website: "www.beans.com",
                                      link: "www.linkedin.com",
                                      role: "Technical",
                                      notes: "Need strong desire to love beans." }}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Job.count' do
      delete job_path(@job)
    end
    assert_redirected_to login_url
  end

=begin
  test "user job should display 'Your Job Postings' but not 'Public Job Postings'" do
    @user.jobs.create!(title: "Dev",
                       company: "Beans & Co.",
                       website: "www.beans.com",
                       link: "www.linkedin.com",
                       role: "Technical",
                       notes: "MEOW MEOW MEOW")
    log_in_as(@user)
    assert @user.jobs.first.valid?
    get jobs_path
    assert_match "Your", response.body
    assert_no_match "Public", response.body
  end

  test "user job should display 'Public Job Postings' but not 'Your Job Postings'" do
    @other_user.jobs.create!(title: "Dev",
                             company: "Beans & Co.",
                             website: "www.beans.com",
                             link: "www.linkedin.com",
                             role: "Technical",
                             notes: "MEOW MEOW MEOW")
    log_in_as(@user)
    assert @other_user.jobs.first.valid?
    get jobs_path
    assert_match "Public", response.body
    assert_no_match "Your", response.body
  end

  test "should redirect destroy for wrong job posting" do
    log_in_as(users(:michael))
    job = jobs(:sadie)
    assert_no_difference 'Job.count' do
      delete job_path(job)
    end
      assert_redirected_to root_url
  end
=end

test "should redirect destroy for wrong jobs" do
  log_in_as(users(:michael))
  job = jobs(:sadie)
  assert_no_difference 'Job.count'do
    delete job_path(job)
  end
  assert_redirected_to root_url
end

end
