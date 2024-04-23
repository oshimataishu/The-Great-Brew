Admin.create!(
  email: "a@a",
  password: "abcdef"
)

10.times do |i|
  ln = Gimei.last
  fn = Gimei.first
  location = Gimei.address
  results = Geocoder.search(location)
  user_i = User.create!(
    email: Faker::Number.number(digits: 5).to_s + "@gmail.com",
    last_name: ln.kanji,
    first_name: fn.kanji,
    last_name_kana: ln.katakana,
    first_name_kana: fn.katakana,
    postal_code: Faker::Number.number(digits: 3),
    address: location.prefecture.kanji,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    is_active: true,
    password: SecureRandom.urlsafe_base64
  )
end


10.times do |n|
  10.times do |m|
    unless n == m
      Relationship.create!(
        follower_id: n+1,
        followed_id: m+1
      )
    end
  end
end