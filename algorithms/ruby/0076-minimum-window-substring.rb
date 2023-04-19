# frozen_string_literal: true

# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  h = Hash.new
  t.each_char do |c|
    h[c] = h[c] ? h[c] + 1 : 1
  end
  max = s.size + 1
  i, j = 0, 0
  c = 0
  res = ""
  while j < s.size
    if c != t.size
      if h[s[j]]
        c += 1 if h[s[j]] > 0
        h[s[j]] -= 1
      end
      j += 1
    end

    while c == t.size
      if h[s[i]]
        c -= 1 if h[s[i]] >= 0
        h[s[i]] += 1
        if j - i < max
          max = j - i
          res = s[i...j]
        end
      end
      i += 1
    end
  end
  res
end
