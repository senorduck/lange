(function() {

  $(function() {
    var contactMenu, elemsToTransition, projectLinks, projects, showProjectLinks;
    projectLinks = $(".project").find("a");
    showProjectLinks = projectLinks.length > 0;
    elemsToTransition = $(".no-csstransitions").length > 0;
    if (elemsToTransition) {
      contactMenu = $("#contact");
      projects = $(".project");
      contactMenu.bind("mouseenter", function(event) {
        return $(this).find("ul").animate({
          height: '74px'
        }, 300);
      }).bind("mouseleave", function(event) {
        return $(this).find("ul").animate({
          height: 0
        }, 300);
      });
      projects.bind("mouseenter", function(event) {
        return $(this).find("img.on").fadeIn(600);
      }).bind("mouseleave", function(event) {
        return $(this).find("img.on").fadeOut(600);
      });
    }
    if (showProjectLinks) {
      return projectLinks.lightBox({
        imageBtnClose: 'img/btn_close.gif',
        imageBtnPrev: 'img/btn_prev.gif',
        imageBtnNext: 'img/btn_next.gif'
      });
    }
  });

}).call(this);
