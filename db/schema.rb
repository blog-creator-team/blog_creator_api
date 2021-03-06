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

ActiveRecord::Schema.define(version: 2019_04_26_171729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "name", null: false
    t.string "author", null: false
    t.boolean "published", default: false
    t.bigint "user_id"
    t.string "subdomain", null: false
    t.index ["subdomain"], name: "index_blogs_on_subdomain", unique: true
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "containers", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "position", null: false
    t.jsonb "attrs", default: {"offsets"=>{"top"=>20, "left"=>10, "right"=>10, "bottom"=>20}, "bg_color"=>"#FFF", "bg_image"=>""}
    t.index ["post_id"], name: "index_containers_on_post_id"
  end

  create_table "elements", force: :cascade do |t|
    t.integer "container_id", null: false
    t.integer "size", null: false
    t.integer "position", null: false
    t.jsonb "attrs", default: {"block"=>{}, "offsets"=>{"top"=>20, "left"=>10, "right"=>10, "bottom"=>20}, "bg_color"=>"#FFF", "bg_image"=>""}
    t.string "type"
    t.index ["container_id"], name: "index_elements_on_container_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "file"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "published", default: false
    t.integer "blog_id", null: false
    t.string "description"
    t.jsonb "attrs", default: {"offsets"=>{"top"=>0, "left"=>0, "right"=>0, "bottom"=>0}, "bg_color"=>"#FFF", "bg_image"=>"", "thumbnail"=>""}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_posts_on_blog_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "blogs", "users"
end
