# frozen_string_literal: true

def make_fancy_string(s)
  return s if s.length < 3

  chars = s.chars
  j = 2

  (2...chars.length).each do |i|
    if chars[i] != chars[j - 1] || chars[i] != chars[j - 2]
      chars[j] = chars[i]
      j += 1
    end
  end

  chars[0...j].join
end
