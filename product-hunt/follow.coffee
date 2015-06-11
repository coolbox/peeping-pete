$.getScript "http://underscorejs.org/underscore-min.js"

range = [1200..1300]
for number in range
    do (number) ->
        a = document.createElement('a')
        linkText = document.createTextNode("Follow")
        a.appendChild(linkText)
        a.href = "#"
        a.className = "followButtons"
        a.dataset.component = "FollowMarker"
        a.dataset.followId = number
        a.dataset.followText = "Follow"
        a.dataset.unfollowText = "Unfollow"
        $("header").first().append(a)

buttons = $("a.followButtons")
for button in buttons
    do (button) ->
        delay = Math.floor(Math.random() * 15000) + 5000
        _.delay( ->
            $(button).click()
        , delay)
 
buttons = $("a.followButtons:contains('Follow')")
for button in buttons
    do (button) ->
        delay = Math.floor(Math.random() * 3000) + 1000
        _.delay( ->
            $(button).click()
        , delay)


##
## Javascript
##

var button, buttons, number, range, _fn, _fn1, _fn2, _i, _j, _k, _l, _len, _len1, _len2, _results;

$.getScript("http://underscorejs.org/underscore-min.js");

range = (function() {
  _results = [];
  for (_i = 1300; _i <= 1500; _i++){ _results.push(_i); }
  return _results;
}).apply(this);

_fn = function(number) {
  var a, linkText;
  a = document.createElement('a');
  linkText = document.createTextNode("Follow");
  a.appendChild(linkText);
  a.href = "#";
  a.className = "followButtons";
  a.dataset.component = "FollowMarker";
  a.dataset.followId = number;
  a.dataset.followText = "Follow";
  a.dataset.unfollowText = "Unfollow";
  return $("header").first().append(a);
};
for (_j = 0, _len = range.length; _j < _len; _j++) {
  number = range[_j];
  _fn(number);
}

buttons = $("a.followButtons");

_fn1 = function(button) {
  var delay;
  delay = Math.floor(Math.random() * 15000) + 5000;
  return _.delay(function() {
    return $(button).click();
  }, delay);
};
for (_k = 0, _len1 = buttons.length; _k < _len1; _k++) {
  button = buttons[_k];
  _fn1(button);
}

buttons = $("a.followButtons:contains('Follow')");

_fn2 = function(button) {
  var delay;
  delay = Math.floor(Math.random() * 3000) + 1000;
  return _.delay(function() {
    return $(button).click();
  }, delay);
};
for (_l = 0, _len2 = buttons.length; _l < _len2; _l++) {
  button = buttons[_l];
  _fn2(button);
}