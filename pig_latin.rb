class String
  def to_igpay_atinlay
    words = self.split

    words.map {|w| w[1..-1] + w[0] + "ay"}

    # pig_words = []
    # words.each do |w|
    #   pig_words << w[1..-1] + w[0] + "ay"
    # end

    pig_words.join(" ")
  end
end
