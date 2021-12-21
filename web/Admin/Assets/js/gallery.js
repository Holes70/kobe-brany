$(document).ready(function(){
  $(".fancybox").fancybox({
        openEffect: "none",
        closeEffect: "none"
    });
    
    $(".zoom").hover(function(){
		$(this).addClass('transition');
	}, function(){
        
		$(this).removeClass('transition');
	});
});

$('.thumbnail').click(function(){
	$('.modal-body').empty();
	$($(this).parents('div').html()).appendTo('.modal-body');
	$('#modal').modal({show:true});
});

$('#modal').on('show.bs.modal', function () {
   $('.col-6,.row .thumbnail').addClass('blur');
})

$('#modal').on('hide.bs.modal', function () {
   $('.col-6,.row .thumbnail').removeClass('blur');
})