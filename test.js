$(document).ready(function() {
	
	$('#potBtn').on("click", function() {
		$('#potModal').modal('show');
	});
	

	
});

// function showPotGuide() {
// 	var totalNeeded = $('#pots').val() * 4;
// 	var blocks = $('#blocks').val() * 8;
// 	var lgBricks = $('#lgBricks').val() * 4;
// 	var smBricks = $('#smBricks').val() * 2;
// 	var pieces = $('#smPieces').val();
// 	var total = blocks + lgBricks + smBricks + pieces;
// 	if (totalNeeded == totalNeeded) $('#potResult').text(total / 4);
//
// }
