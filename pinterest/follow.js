var buttons = $("span:contains('Follow')");

$("button span:contains('Follow')").parent().each(function(){
  $(this).click();
  window.scrollTo(0,document.body.scrollHeight);
});