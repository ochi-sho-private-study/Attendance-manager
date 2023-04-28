# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
SEED_COMPANY_NAMES = [
  'セブン&アイ・ホールディングス',
  'ローソン',
  'ミニストップ',
  'ファミリーマート',
  'ユニー・ホールディングス',
  'セイコーホールディングス',
  'ドン・キホーテ・ホールディングス',
  'サークルKサンクス',
  'グッドデイ',
  'セイコーマート',
  'ジーエス・ユアサ・ホールディングス',
  'ローソンエンタテインメント',
  'ピースワン',
  'デイリーヤマザキ',
  'マックスバリュ・ジャパン',
  'セブンドリームス・ホールディングス',
  'ファミマ・ドット・コム',
  'サンコー',
  'テンポス'
].freeze

companies = SEED_COMPANY_NAMES.map do |company_name|
  { name: company_name, telephone_number: '000-0000-0000' }
end

Company.insert_all!(companies) # rubocop:disable Rails/SkipsModelValidations

stores = Company.all.flat_map.with_index do |company, index|
  Array.new(5) do |number|
    {
      company_id: company.id,
      name: "#{company.name}六本木一号店#{index + number + 1}",
      email: "test-#{index + number + 1}@gmail.com",
      password_digest: BCrypt::Password.create('password')
    }
  end
end

Store.insert_all!(stores) # rubocop:disable Rails/SkipsModelValidations

POSITION_NAMES = %w[
  店長
  パート
  アルバイト
  オーナー
].freeze

POSITION_NAMES.each do |name|
  Position.create!(company: Company.first, name: name)
end

WorkShiftMaster.create!(name: '夕勤', start_time: '17:00', end_time: '22:00')
WorkShiftMaster.create!(name: '夜勤A', start_time: '22:00', end_time: '3:00')
WorkShiftMaster.create!(name: '夜勤B', start_time: '3:00', end_time: '8:00')
WorkShiftMaster.create!(name: '夜勤フルタイム', start_time: '22:00', end_time: '8:00')
