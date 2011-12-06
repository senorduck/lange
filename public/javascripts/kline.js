function narf(){
    $("#contact").mouseenter(function(){
      $(this).find("ul").stop(true,false).animate({height:"74"},300);
    }).mouseleave(function(){
      $(this).find("ul").stop(true,false).animate({height:"0"},300);
    });
}
function work(){
  $(".project").mouseenter(function(){
    $(this).find("img.on").fadeIn(600);
  }).mouseleave(function(){
    $(this).find("img.on").fadeOut(600);
  });
  $(".project a").lightBox({
    imageBtnClose:'images/btn_close.gif',imageBtnPrev:'images/btn_prev.gif',imageBtnNext:'images/btn_next.gif'
  });
}