$ ->
	@elemsToTransition = $(".no-csstransitions")
	@contactMenu = @elemsToTransition.find("#contact")
	@projects = @elemsToTransition.find(".project")
	@projectLinks = $(".project").find("a")
	showProjectLinks = @projectLinks.length > 0

	@contactMenu
		.bind "mouseenter", (event) ->
			$(this).find("ul")
			.animate height: '74px', 300
		.bind "mouseleave", (event) ->
			$(this).find("ul").animate height: 0, 300

	@projects
		.bind "mouseenter", (event) ->
			$(this).find("img.on").animate opacity: 1.0, 600

		.bind "mouseleave", (event) ->
			$(this).find("img.on").animate opacity: 0, 600
	
	if showProjectLinks
		@projectLinks
			.lightBox
				imageBtnClose: 'img/btn_close.gif'
				imageBtnPrev: 'img/btn_prev.gif'
				imageBtnNext: 'img/btn_next.gif'