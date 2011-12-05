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
    imageBtnClose:'img/btn_close.gif',imageBtnPrev:'img/btn_prev.gif',imageBtnNext:'img/btn_next.gif'
  });
}