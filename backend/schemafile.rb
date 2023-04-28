# vi: ft=ruby
# frozen_string_literal: true

create_table :companies, charset: 'utf8mb4', force: :cascade do |t|
  t.string :name, null: false
  t.string :telephone_number
  t.timestamps
end

create_table :stores, charset: 'utf8mb4', force: :cascade do |t|
  t.references :company, foreign_key: true, null: false, index: true
  t.string :name, null: false
  t.string :email # TODO: emailがないとパスワード再発行できないので、必須にする。
  t.string :password_digest, null: false
  t.timestamps
end

create_table :employees, charset: 'utf8mb4', force: :cascade do |t|
  t.references :company, foreign_key: true, null: false, index: true
  t.string :last_name, null: false, index: true
  t.string :first_name, null: false
  t.string :email
  t.string :password_digest, null: false
  t.datetime :birthday
  # TODO: 削除フラグを追加する。(paranoiaを用いる)
  t.timestamps
  t.index :email, unique: true
end

create_table :positions, charset: 'utf8mb4', force: :cascade do |t|
  t.string :name, null: false
  # NOTE: 企業単位で役職が異なるのでcompany_idを外部キーに持つ。
  t.references :company, foreign_key: true, null: false, index: true
  # TODO: 従業員ログインの際、権限チェックをしたいのでroleカラムを追加する
  t.timestamps
end

create_table :position_assignments, charset: 'utf8mb4', force: :cascade do |t|
  t.references :employee, foreign_key: true, null: false, index: true
  t.references :position, foreign_key: true, null: false, index: true
  t.timestamps
end

# NOTE: シフトの勤務時間帯マスタ
create_table :work_shift_masters, charset: 'utf8mb4', force: :cascade do |t|
  t.string :name, default: 'その他', comment: 'シフトの時間帯名 (ex. 夜勤)'
  t.datetime :start_time, null: false, comment: 'シフトの開始時刻'
  t.datetime :end_time, null: false, comment: 'シフトの終了時刻'
  t.timestamps
end

create_table :work_shifts, charset: 'utf8mb4', force: :cascade do |t|
  t.references :store, foreign_key: true, null: false, index: true
  t.references :employee, foreign_key: true, null: false, index: true
  t.references :work_shift_master, foreign_key: true, null: false, index: true
  t.integer    :day_of_week, null: false, comment: 'シフトの曜日'
end
