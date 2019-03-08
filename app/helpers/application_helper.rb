module ApplicationHelper

  # return the question answer
  def question_answer(question_id,question_user_submission_id)
    @answer = QuestionAnswer.where(:question_id => question_id).where(:question_user_submission_id => question_user_submission_id).first
  end

  # return the question user submission id
  def question_user_submission(question_user_id,page_id)
    @question_user_submission=QuestionUserSubmission.where(:question_user_id =>question_user_id).where(:page_id =>page_id).first
  end

  # Reverse the boolean field value " true / false "
  def ReverseField(object,field)
    object.update_attribute("#{field}",!object["#{field}"])
  end

  # Return the question data
  def question(question_id)
    @question_details=Question.where(:id=>question_id).first
  end

  # return the question type
  def question_type(question_id)
    @question_type=Question.where(:id=>question_id).first.question_type
  end

  # return the question page
  def question_page(question_id)
    Question.find(question_id).pages_questions.each do |question_page|
      if question_page.page.present?
        # if question_page.page.social_media_platform_id == platform_id.to_i
        @question_page_id = question_page.page_id
        # end
      end
    end
  end

  # return the social media platform "using it in the questionaires notifications system"
  def getSocialMediaPlatform(page_id)
    @platform=SocialMediaPlatform.where(:id=>page_id).first.title
  end

  # Return the content management page data
  def cms_page_content(page_name)
    # replace the unneeded link parameters
    # page_name=request.original_url.gsub(root_url,"").gsub("resources/","").gsub("about/","")
    # get the page content
    if ContentManagementPage.where(:page=>page_name).count > 0
      @page=ContentManagementPage.where(:page=>page_name).first
    end
  end

  # return which question this option for
  def depends_on_question(option_id)
  	@depends_on_question=QuestionOption.where(:id=>option_id).first.question_id
  end

	# add question answer
  def add_question_answer(question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text)
		@question_answer = QuestionAnswer.new(:question_id=>question_id,
      :question_user_submission_id=>question_user_id,
      :uploaded_file_id=>uploaded_file_id,
      :question_option_id=>question_option_id,
      :other_option_answer=>other_option_answer,
      :country_id=>country_id,
      :language_id=>language_id,
      :answer_text=>answer_text)
		@question_answer.save
  end

  # There was just too much clutter in the view, DRY here
  def file_download_link(submission)
    return nil if submission.question_answer.nil?
    uf = submission.question_answer.uploaded_file
    return nil if uf.nil? or uf.the_file.nil?
    link_to "Download the file", uf.the_file.expiring_url(600)
  end

  # show the multi select options question user answers
  def showMultiOptionsAnswers(question_id,question_user_submission_id)
    @question_answers=QuestionAnswer.where(:question_id=>question_id).where(:question_user_submission_id=>question_user_submission_id)
  end

  # get the registerd questions for every page
  def PageQuestions(page_id)
    @registerd_questions=PagesQuestion.where(:page_id =>page_id);
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
