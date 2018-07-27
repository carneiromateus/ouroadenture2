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

ActiveRecord::Schema.define(version: 20180726233603) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "backgroundColor"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories_eventos", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "evento_id"
  end

  create_table "categories_oficinas", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "oficina_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "colaborators", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "conections", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "news_id"
  end

  create_table "directors_news", id: false, force: :cascade do |t|
    t.integer "news_id",     null: false
    t.integer "director_id", null: false
    t.index ["news_id", "director_id"], name: "index_directors_news_on_news_id_and_director_id"
  end

  create_table "editals", force: :cascade do |t|
    t.string   "name"
    t.date     "date_end"
    t.date     "date_start"
    t.date     "date_published"
    t.text     "descricao"
    t.string   "situacao"
    t.string   "tipo_edital"
    t.integer  "user_id"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_editals_on_user_id"
  end

  create_table "editions", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.text     "description"
    t.integer  "user_id"
    t.text     "subtitle"
    t.text     "short_description"
    t.string   "legend"
    t.string   "duration"
    t.string   "address"
    t.float    "value"
    t.string   "dates"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_editions_on_user_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.datetime "publish_at"
    t.datetime "date_end"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.text     "description"
    t.text     "subtitle"
    t.text     "short_description"
    t.string   "legend"
    t.string   "duration"
    t.string   "address"
    t.float    "value"
    t.string   "dates"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "feiras", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "image_editions", force: :cascade do |t|
    t.string   "url_file_name"
    t.string   "url_content_type"
    t.integer  "url_file_size"
    t.datetime "url_updated_at"
    t.integer  "edition_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["edition_id"], name: "index_image_editions_on_edition_id"
  end

  create_table "image_events", force: :cascade do |t|
    t.string   "url_file_name"
    t.string   "url_content_type"
    t.integer  "url_file_size"
    t.datetime "url_updated_at"
    t.integer  "events_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["events_id"], name: "index_image_events_on_events_id"
  end

  create_table "image_news", force: :cascade do |t|
    t.string   "url_file_name"
    t.string   "url_content_type"
    t.integer  "url_file_size"
    t.datetime "url_updated_at"
    t.integer  "news_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["news_id"], name: "index_image_news_on_news_id"
  end

  create_table "inscricaos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logos", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.string   "facebook"
    t.string   "flickr"
    t.string   "instagram"
    t.string   "estaEdicaoTitle"
    t.text     "estaEdicaoDesc"
    t.string   "contatoEmail"
    t.text     "contatoEnd"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "favi_file_name"
    t.string   "favi_content_type"
    t.integer  "favi_file_size"
    t.datetime "favi_updated_at"
  end

  create_table "midia", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.string   "publish_by"
    t.string   "local"
    t.datetime "publish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.text     "description"
    t.integer  "user_id"
    t.text     "subtitle"
    t.text     "short_description"
    t.string   "legend"
    t.string   "duration"
    t.string   "address"
    t.float    "value"
    t.string   "dates"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "video_url"
    t.integer  "director_id"
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "oficinas", force: :cascade do |t|
    t.string   "name"
    t.string   "descripton"
    t.float    "value"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.integer  "vacancies"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "location"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "slides", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.string   "subtitle"
    t.string   "link"
    t.integer  "order"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.string   "link"
    t.integer  "order"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "size"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
