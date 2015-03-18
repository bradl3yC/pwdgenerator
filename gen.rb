class Password

  $chars = "abcdefghijklmnopqrstuvwxyz1234567890"
  $special_chars = "-%=|."

  def generate(length=10)
    password = add_special_characters(Array.new(length) { $chars[rand($chars.length)].chr })
    pad_smaller_passwords(password)
  end

  private

  def add_special_characters(seed)
    (2..4).each do |i|
      seed[rand(2..9)] = $special_chars[rand($special_chars.length)].chr
    end
    seed
  end

  def pad_smaller_passwords(password)
    while password.uniq.length < 10 do
      password << $chars[rand($chars.length)].chr
      password.uniq!
    end
    password.join
  end
end

pass = Password.new
59.times do puts "#{pass.generate}" + "," end
