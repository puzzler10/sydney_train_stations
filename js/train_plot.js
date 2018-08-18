(function($) {
    $(document).ready(function() {
	
	$('#train_plot').scianimator({
	    'images': ['images/train_plot1.png', 'images/train_plot2.png', 'images/train_plot3.png', 'images/train_plot4.png', 'images/train_plot5.png', 'images/train_plot6.png', 'images/train_plot7.png', 'images/train_plot8.png', 'images/train_plot9.png', 'images/train_plot10.png', 'images/train_plot11.png', 'images/train_plot12.png', 'images/train_plot13.png', 'images/train_plot14.png', 'images/train_plot15.png', 'images/train_plot16.png', 'images/train_plot17.png'],
	    'width': 480,
	    'delay': 1000,
	    'loopMode': 'loop',
 'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed']
	});
	$('#train_plot').scianimator('play');
    });
})(jQuery);
