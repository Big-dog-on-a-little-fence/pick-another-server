module UserStarredTunesHelper
  def form_submit_text
    if @user_starred_tune.id.present?
      "Update goal"
    else
      "Add starred tune"
    end
  end
end
