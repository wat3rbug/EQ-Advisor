$(document).ready(function() {
	
	$('#potBtn').on("click", function() {
		$('#potModal').modal('show');
	});
});

function calcPotions() {
	
	// there has to be a better way to ensure proper casting of values
	
	var totalNeeded = $('#pots').val() * 4;
	var blocks = $('#blocks').val() * 8;
	var lgBricks = $('#lgBricks').val() * 4;
	var smBricks = $('#smBricks').val() * 2;
	var pieces = $('#smPieces').val() * 1;
	var totalAcquired = blocks + lgBricks + smBricks + pieces;
	var total = Math.floor(totalAcquired / 4);
	if (total == total) {	// because NaN is NOT = to itself, basic check
		$('#potResult').text(total);
		if (totalAcquired >= totalNeeded) {
			$("#potResult").addClass("text-success").removeClass("text-danger");
		} else {
			$("#potResult").removeClass("text-success").addClass("text-danger");
		}
	}	
};

