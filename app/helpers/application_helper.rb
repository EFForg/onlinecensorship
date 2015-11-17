module ApplicationHelper

  # Return the question data
  def question(question_id)
    @question_details=Question.where(:id=>question_id).first
  end

  # return the question type
  def question_type(question_id)
    @question_type=Question.where(:id=>question_id).first.question_type
  end

  # return the question page
  def question_page(question_id,platform_id)
    Question.find(question_id).pages_questions.each do |question_page|
      if question_page.page.present?
        if question_page.page.social_media_platform_id == platform_id.to_i
          @question_page_id=question_page.page_id
        end
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
		@question_answer=QuestionAnswer.new(:question_id=>question_id,:question_user_submission_id=>question_user_id,:uploaded_file_id=>uploaded_file_id,:question_option_id=>question_option_id,:other_option_answer=>other_option_answer ,:country_id=>country_id,:language_id=>language_id,:answer_text=>answer_text)
		@question_answer.save
  end

  # add question answer
  def UploadedFileData(uploaded_file_id)
    @uploaded_file=UploadedFile.where(:id=>uploaded_file_id).first
  end

  # create folder
  def CreateFolder(folder_name)
    if !File.directory?(folder_name)
      Dir.mkdir(folder_name,0700)
    end
  end

  # upload file to the server
  def UploadFile(my_file,my_directory)
    @file_name=my_file.original_filename
    path = File.join(my_directory,@file_name)
    File.open(path,"wb") do |file|
      file.write(my_file.read)
    end
  end

  # show the multi select options question user answers
  def showMultiOptionsAnswers(question_id,question_user_submission_id)
    @question_answers=QuestionAnswer.where(:question_id=>question_id).where(:question_user_submission_id=>question_user_submission_id)
  end

  # get the registerd questions for every page
  def PageQuestions(page_id)
    @registerd_questions=PagesQuestion.where(:page_id =>page_id);
  end

  def piwiki_tracking_code(site_id, page_title)
    <<-EOF
      <div id="anon-stats">
        <noscript>
          <img src="https://anon-stats.eff.org/piwik.php?idsite=#{site_id}&amp;rec=1&amp;action_name=#{page_title}" style="border:0" alt="" />
        </noscript>
        <script>
          document.getElementById('anon-stats').innerHTML = '<img src="https://anon-stats.eff.org/piwik.php?idsite=#{site_id}&amp;rec=1&amp;urlref='+encodeURIComponent(document.referrer)+'&amp;action_name=#{page_title}" style="border:0" alt="" />';
        </script>
      </div>
    EOF
  end

end
