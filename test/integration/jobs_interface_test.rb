require 'test_helper'

class JobsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "job interface" do
    log_in_as(@user)
    get root_path
    # Invalid submission
    assert_no_difference 'Job.count' do
      post jobs_path, params: { job: { title: ""} }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    title = "Co-Founder"
    assert_difference 'Job.count', 1 do
      post jobs_path, params: { job: {
        title: title,
        company: "Sadie & Co.",
        website: "www.sadiehopkins.com",
        link: "www.linkedin.com/snades",
        role: "Technical",
        elevator_pitch: "Sample elevator pitch",
        why_get_excited: "Why get excited",
        description: "Sample job description",
        location: "Toronto" 
        } }
    end
    assert_redirected_to jobs_url
    follow_redirect!
    assert_match title, response.body
    # Delete post
    first_job = @user.jobs.paginate(page: 1).first
    assert_difference 'Job.count', -1 do
      delete job_path(first_job)
    end
  end

end
