# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      # パスワードをハッシュ化してDBに登録する。
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # パスワードをリセットし、それを通知する際に使用。
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      # cookieを使用してユーザーを記録するためのトークン作成に使用。
      t.datetime :remember_created_at

      ## Trackable
      # サインイン回数やサインイン時間などを記録するために使用。
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # メールに記載されたURLにをクリックして本登録を完了する機能で使用する。
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # 一定回数以上サインインを失敗するとアカウントをロックする機能で使用する。
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
