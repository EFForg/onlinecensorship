# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161123113308) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translations", force: true do |t|
    t.integer  "category_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id", using: :btree
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.text     "pgp_key"
    t.integer  "contacts_topic_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "replied",           default: false
    t.string   "replied_by"
  end

  create_table "contacts_topic_translations", force: true do |t|
    t.integer  "contacts_topic_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "contacts_topic_translations", ["contacts_topic_id"], name: "index_contacts_topic_translations_on_contacts_topic_id", using: :btree
  add_index "contacts_topic_translations", ["locale"], name: "index_contacts_topic_translations_on_locale", using: :btree

  create_table "contacts_topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_management_page_translations", force: true do |t|
    t.integer  "content_management_page_id", null: false
    t.string   "locale",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.text     "brief"
    t.string   "page_title"
  end

  add_index "content_management_page_translations", ["content_management_page_id"], name: "index_283c67b9d2b42ce6584b9a0ba821f2fee92dc77d", using: :btree
  add_index "content_management_page_translations", ["locale"], name: "index_content_management_page_translations_on_locale", using: :btree

  create_table "content_management_pages", force: true do |t|
    t.string   "page"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "brief"
    t.string   "page_title"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_translations", force: true do |t|
    t.integer  "country_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "country_translations", ["country_id"], name: "index_country_translations_on_country_id", using: :btree
  add_index "country_translations", ["locale"], name: "index_country_translations_on_locale", using: :btree

  create_table "faq_translations", force: true do |t|
    t.integer  "faq_id",     null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "question"
    t.text     "answer"
  end

  add_index "faq_translations", ["faq_id"], name: "index_faq_translations_on_faq_id", using: :btree
  add_index "faq_translations", ["locale"], name: "index_faq_translations_on_locale", using: :btree

  create_table "faqs", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "theorder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "further_read_translations", force: true do |t|
    t.integer  "further_read_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "author"
    t.string   "written_in"
  end

  add_index "further_read_translations", ["further_read_id"], name: "index_further_read_translations_on_further_read_id", using: :btree
  add_index "further_read_translations", ["locale"], name: "index_further_read_translations_on_locale", using: :btree

  create_table "further_reads", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "author"
    t.string   "link"
    t.string   "written_in"
    t.integer  "year"
    t.integer  "the_order"
  end

  create_table "home_field_translations", force: true do |t|
    t.integer  "home_field_id",   null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "slogan"
    t.string   "what_oc_title"
    t.text     "what_oc_text"
    t.text     "appeal_text"
    t.string   "appeal_btn_text"
    t.string   "submit_btn_text"
  end

  add_index "home_field_translations", ["home_field_id"], name: "index_home_field_translations_on_home_field_id", using: :btree
  add_index "home_field_translations", ["locale"], name: "index_home_field_translations_on_locale", using: :btree

  create_table "home_fields", force: true do |t|
    t.text     "slogan"
    t.string   "what_oc_title"
    t.text     "what_oc_text"
    t.text     "appeal_text"
    t.string   "appeal_btn_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "submit_btn_text"
  end

  create_table "language_translations", force: true do |t|
    t.integer  "language_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "language_translations", ["language_id"], name: "index_language_translations_on_language_id", using: :btree
  add_index "language_translations", ["locale"], name: "index_language_translations_on_locale", using: :btree

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "submit_report"
    t.boolean  "contact_us"
    t.boolean  "subscriber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_translations", force: true do |t|
    t.integer  "page_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale", using: :btree
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "social_media_platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "theorder"
    t.text     "message"
  end

  create_table "pages_questions", force: true do |t|
    t.integer  "question_id"
    t.integer  "page_id"
    t.integer  "dependent_on_question"
    t.integer  "question_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.text     "bio"
    t.boolean  "advisor"
    t.boolean  "team"
    t.boolean  "author"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "role"
    t.integer  "theorder"
    t.string   "slug"
  end

  create_table "person_translations", force: true do |t|
    t.integer  "person_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "bio"
    t.text     "role"
  end

  add_index "person_translations", ["locale"], name: "index_person_translations_on_locale", using: :btree
  add_index "person_translations", ["person_id"], name: "index_person_translations_on_person_id", using: :btree

  create_table "platform_link_translations", force: true do |t|
    t.integer  "platform_link_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "platform_name"
    t.string   "help_link"
    t.string   "support_link"
  end

  add_index "platform_link_translations", ["locale"], name: "index_platform_link_translations_on_locale", using: :btree
  add_index "platform_link_translations", ["platform_link_id"], name: "index_platform_link_translations_on_platform_link_id", using: :btree

  create_table "platform_links", force: true do |t|
    t.string   "platform_name"
    t.string   "support_link"
    t.string   "help_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_translations", force: true do |t|
    t.integer  "post_id",            null: false
    t.string   "locale",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.text     "intro"
    t.string   "tags"
    t.string   "side_image_caption"
    t.string   "quote_author"
    t.text     "quote_text"
    t.text     "twitter_text"
    t.string   "news_source"
    t.string   "image_author_name"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.string   "pdf_file_size"
    t.string   "pdf_updated_at"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
    t.date     "publish_date"
    t.text     "intro"
    t.string   "tags"
    t.string   "side_image_caption"
    t.string   "side_image_file_name"
    t.string   "side_image_content_type"
    t.integer  "side_image_file_size"
    t.datetime "side_image_updated_at"
    t.boolean  "published",               default: false
    t.string   "link"
    t.string   "slug"
    t.boolean  "featured",                default: false
    t.string   "side_image_link"
    t.string   "quote_author"
    t.text     "quote_text"
    t.text     "twitter_text"
    t.string   "news_source"
    t.boolean  "pinned",                  default: false
    t.string   "image_link"
    t.string   "image_author_name"
    t.string   "image_author_link"
    t.string   "cc_license"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "posts_posts_themes", force: true do |t|
    t.integer  "post_id"
    t.integer  "posts_theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts_social_media_platforms", force: true do |t|
    t.integer  "post_id"
    t.integer  "social_media_platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts_theme_translations", force: true do |t|
    t.integer  "posts_theme_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "posts_theme_translations", ["locale"], name: "index_posts_theme_translations_on_locale", using: :btree
  add_index "posts_theme_translations", ["posts_theme_id"], name: "index_posts_theme_translations_on_posts_theme_id", using: :btree

  create_table "posts_themes", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts_themes_quotes", force: true do |t|
    t.integer  "quote_id"
    t.integer  "posts_theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "uploaded_file_id"
    t.integer  "question_option_id"
    t.integer  "country_id"
    t.integer  "language_id"
    t.text     "answer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_user_submission_id"
    t.string   "other_option_answer"
  end

  create_table "question_option_translations", force: true do |t|
    t.integer  "question_option_id", null: false
    t.string   "locale",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "option_title"
  end

  add_index "question_option_translations", ["locale"], name: "index_question_option_translations_on_locale", using: :btree
  add_index "question_option_translations", ["question_option_id"], name: "index_question_option_translations_on_question_option_id", using: :btree

  create_table "question_options", force: true do |t|
    t.integer  "question_id"
    t.string   "option_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_translations", force: true do |t|
    t.integer  "question_id",    null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "question_title"
    t.string   "prompt_text"
    t.string   "prompt_link"
    t.text     "placeholder"
  end

  add_index "question_translations", ["locale"], name: "index_question_translations_on_locale", using: :btree
  add_index "question_translations", ["question_id"], name: "index_question_translations_on_question_id", using: :btree

  create_table "question_user_submissions", force: true do |t|
    t.integer  "question_user_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_users", force: true do |t|
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "inform_platform",          default: false
    t.string   "age"
    t.boolean  "contact",                  default: true
    t.boolean  "case_study",               default: false
    t.string   "language"
    t.string   "pgp_key"
    t.text     "communication_preference"
  end

  create_table "questions", force: true do |t|
    t.text     "question_title"
    t.string   "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "other_answer",   default: false
    t.string   "prompt_text"
    t.string   "prompt_link"
    t.boolean  "required_field", default: true
    t.string   "placeholder"
  end

  create_table "quote_translations", force: true do |t|
    t.integer  "quote_id",     null: false
    t.string   "locale",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.text     "quote"
    t.text     "twitter_text"
  end

  add_index "quote_translations", ["locale"], name: "index_quote_translations_on_locale", using: :btree
  add_index "quote_translations", ["quote_id"], name: "index_quote_translations_on_quote_id", using: :btree

  create_table "quotes", force: true do |t|
    t.string   "author"
    t.text     "quote"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "twitter_text"
    t.boolean  "featured",     default: true
    t.integer  "font_size",    default: 16
  end

  create_table "quotes_social_media_platforms", force: true do |t|
    t.integer  "quote_id"
    t.integer  "social_media_platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_media_platform_translations", force: true do |t|
    t.integer  "social_media_platform_id", null: false
    t.string   "locale",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "social_media_platform_translations", ["locale"], name: "index_social_media_platform_translations_on_locale", using: :btree
  add_index "social_media_platform_translations", ["social_media_platform_id"], name: "index_09379ecb3055166365c9619341e09b593d47e89c", using: :btree

  create_table "social_media_platforms", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "color"
    t.string   "font_awesome_style"
    t.string   "slug"
  end

  create_table "stories", force: true do |t|
    t.string   "title"
    t.text     "brief"
    t.text     "content"
    t.string   "external_link"
    t.boolean  "published",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "story_translations", force: true do |t|
    t.integer  "story_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "brief"
    t.text     "content"
  end

  add_index "story_translations", ["locale"], name: "index_story_translations_on_locale", using: :btree
  add_index "story_translations", ["story_id"], name: "index_story_translations_on_story_id", using: :btree

  create_table "subscribes", force: true do |t|
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.boolean  "confirmed",          default: false
  end

  create_table "uploaded_files", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_answer_id"
    t.string   "the_file_file_name"
    t.string   "the_file_content_type"
    t.integer  "the_file_file_size"
    t.datetime "the_file_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
