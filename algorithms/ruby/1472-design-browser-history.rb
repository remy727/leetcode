# frozen_string_literal: true

# 1472. Design Browser History
# https://leetcode.com/problems/design-browser-history

=begin

You have a browser of one tab where you start on the homepage and you can visit another url, get back in the history number of steps or move forward in the history number of steps.

Implement the BrowserHistory class:

* BrowserHistory(string homepage) Initializes the object with the homepage of the browser.
* void visit(string url) Visits url from the current page. It clears up all the forward history.
* string back(int steps) Move steps back in history. If you can only return x steps in the history and steps > x, you will return only x steps. Return the current url after moving back in history at most steps.
* string forward(int steps) Move steps forward in history. If you can only forward x steps in the history and steps > x, you will forward only x steps. Return the current url after forwarding in history at most steps.

### Constraints:

* 1 <= homepage.length <= 20
* 1 <= url.length <= 20
* 1 <= steps <= 100
* homepage and url consist of  '.' or lower case English letters.
* At most 5000 calls will be made to visit, back, and forward.

=end

class BrowserHistory
=begin
  :type homepage: String
=end
  def initialize(homepage)
    @sites = [homepage]
    @cur = 0
  end


=begin
  :type String
  :rtype: Void
=end
  def visit(url)
    @cur += 1
    # @sites[@cur..@sites.length] = nil
    @sites = @sites.slice(0, @cur)
    @sites[@cur] = url
  end


=begin
  :type steps: Integer
  :rtype: String
=end
  def back(steps)
    @cur = [@cur - steps, 0].max
    @sites[@cur]
  end


=begin
  :type steps: Integer
  :rtype: String
=end
  def forward(steps)
    @cur = [@cur + steps, @sites.length - 1].min
    @sites[@cur]
  end
end

# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory.new(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)
