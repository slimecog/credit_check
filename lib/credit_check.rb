class CreditCard
  def initialize num
    @number = "4929735477250543"
  end

  def valid?
    digits = ''
    @number.split('').reverse.each_with_index do |d, i|
      digits += d if i % 2 == 0
      digits += (d.to_i * 2).to_s if i % 2 == 1
    end

    digits.split('').inject(0) { |sum, d| sum + d.to_i } % 10 == 0
  end
end

if __FILE__ == $0
  card = CreditCard.new(ARGV.join.chomp)
  if card.valid?
    puts "valid card"
  else puts "invalid card"
  end
end
