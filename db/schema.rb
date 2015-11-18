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

ActiveRecord::Schema.define(version: 20151116145204) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "pgp_key"
    t.integer  "contacts_topic_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts_topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "faqs", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "theorder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "pages", force: true do |t|
    t.integer  "social_media_platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "theorder"
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

  create_table "question_options", force: true do |t|
    t.integer  "question_id"
    t.string   "option_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_user_submissions", force: true do |t|
    t.integer  "question_user_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "inform_platform", default: false
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

  create_table "subscribes", force: true do |t|
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
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
