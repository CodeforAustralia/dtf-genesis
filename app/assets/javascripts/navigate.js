$('.next').click(function(){
  console.log("::: next");
  $('.nav-pills > .active').next('li').find('a').trigger('click');
});
$('.back').click(function(){
  console.log("::: back");
  $('.nav-pills > .active').prev('li').find('a').trigger('click');
});
