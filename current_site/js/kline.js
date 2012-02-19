(function() {

  $(function() {
    var showProjectLinks;
    this.elemsToTransition = $(".no-csstransitions");
    this.contactMenu = this.elemsToTransition.find("#contact");
    this.projects = this.elemsToTransition.find(".project");
    this.projectLinks = $(".project").find("a");
    showProjectLinks = this.projectLinks.length > 0;
    this.contactMenu.bind("mouseenter", function(event) {
      return $(this).find("ul").animate({
        height: '74px'
      }, 300);
    }).bind("mouseleave", function(event) {
      return $(this).find("ul").animate({
        height: 0
      }, 300);
    });
    this.projects.bind("mouseenter", function(event) {
      return $(this).find("img.on").animate({
        opacity: 1.0
      }, 600);
    }).bind("mouseleave", function(event) {
      return $(this).find("img.on").animate({
        opacity: 0
      }, 600);
    });
    if (showProjectLinks) {
      return this.projectLinks.lightBox({
        imageBtnClose: 'img/btn_close.gif',
        imageBtnPrev: 'img/btn_prev.gif',
        imageBtnNext: 'img/btn_next.gif'
      });
    }
  });

}).call(this);
