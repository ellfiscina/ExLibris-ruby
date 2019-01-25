class InitSchema < ActiveRecord::Migration[5.0]
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    create_table "active_storage_attachments" do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.bigint "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end
    create_table "active_storage_blobs" do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.bigint "byte_size", null: false
      t.string "checksum", null: false
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end
    create_table "admins" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet "current_sign_in_ip"
      t.inet "last_sign_in_ip"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_admins_on_email", unique: true
      t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    end
    create_table "authors" do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "books_count"
    end
    create_table "books" do |t|
      t.string "isbn"
      t.string "title"
      t.string "subtitle"
      t.integer "year"
      t.integer "pages"
      t.integer "edition"
      t.string "language"
      t.bigint "editor_id"
      t.bigint "author_id"
      t.bigint "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "status"
      t.integer "shelf"
      t.integer "published"
      t.integer "pages_read"
      t.integer "position"
      t.index ["author_id"], name: "index_books_on_author_id"
      t.index ["editor_id"], name: "index_books_on_editor_id"
      t.index ["user_id"], name: "index_books_on_user_id"
    end
    create_table "books_lists", id: false do |t|
      t.bigint "list_id", null: false
      t.bigint "book_id", null: false
      t.index ["book_id"], name: "index_books_lists_on_book_id"
      t.index ["list_id"], name: "index_books_lists_on_list_id"
    end
    create_table "editors" do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "books_count"
    end
    create_table "lists" do |t|
      t.integer "year"
      t.bigint "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_lists_on_user_id"
    end
    create_table "users" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string "current_sign_in_ip"
      t.string "last_sign_in_ip"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "books_count"
      t.string "name"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
    add_foreign_key "books", "authors"
    add_foreign_key "books", "editors"
    add_foreign_key "books", "users"
    add_foreign_key "lists", "users"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
