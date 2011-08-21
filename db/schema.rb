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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110728085507) do

  create_table "admin_people", :force => true do |t|
    t.integer  "userID"
    t.integer  "lessonID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_people_lessons", :id => false, :force => true do |t|
    t.integer  "admin_person_id"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administrators", :force => true do |t|
    t.string   "name"
    t.integer  "lessionID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", :force => true do |t|
    t.integer  "choice_id"
    t.integer  "user_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choices", :force => true do |t|
    t.string   "ChoiceAnswers"
    t.integer  "quest_id"
    t.boolean  "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_details", :force => true do |t|
    t.string   "classname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_developers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_infos", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers", :force => true do |t|
    t.integer  "userid"
    t.integer  "lessonID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers_lessons", :id => false, :force => true do |t|
    t.integer  "developer_id"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homes", :force => true do |t|
    t.string   "name"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_classes", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "class_detail_id"
    t.string   "unique_classid"
    t.integer  "teacherid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_pages", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "content_info_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.string   "lessonName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionnaires", :force => true do |t|
    t.string   "questionnaireName"
    t.integer  "questionID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quests", :force => true do |t|
    t.string   "question"
    t.string   "image"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_details", :force => true do |t|
    t.string   "user_id"
    t.string   "class_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_lessons", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.integer  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "classname"
    t.string   "standard"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_details", :force => true do |t|
    t.integer  "lessionID"
    t.string   "classname"
    t.integer  "classID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_lessons", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", :force => true do |t|
    t.integer  "lessionID"
    t.string   "classname"
    t.integer  "classID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
