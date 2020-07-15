
var sch = function() {
	
};

sch.ajaxRequest = function( options ) {
	$.ajax( {
        type: "POST",
        url: ajax_url,
        data: { 'action' : 'action', 'page': options.page, 'page_action': options.pageAction, 'data': options.data },
        beforeSend: function() {
        	$(options.selector).append( '<div class="loaderOverlay"></div><div class="loader"></div>')
        },
        success: function( res ){
        	$(options.selector + ' .loaderOverlay').remove();
        	$(options.selector + ' .loader').remove();
        	options.success( res );
        },
        error: options.error,
        complete: options.complete
      })
};

sch.formJsonSerialize = function( $form ) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}

sch.loadUnitFilter = function( options ) {
	$( options.unit_selector ).prop( 'disabled', false );	
	var trade_id = options.trade_id;
	var batch_id = options.batch_id;	

	sch.ajaxRequest({
		'page': 'sch-trades',
		'pageAction': 'get_trade_unit_lists',
		'selector': options.selector,
		data:  { 'TradeId': trade_id, 'BatchId': batch_id },
		success: function( res ) {
			
			if( '' != res ) {
				var units = $.parseJSON( res );

				if( 0 == units.length ) {
					$('#message').html('<div class="error_msg_div"><span class="error_msg_span">No Unit assigned for this batch.</span></div>');
					$('#unit_id').prop( 'disabled', true );	
					return;
				}

				strOption = '';
				$(units).each( function( index, unit ){
					strOption += '<option value="' + unit.id + '">' + unit.unit_name+ '</option>';
				});
				strHTML = '<select name="unit_id" id = "unit_id" class="wpsp-form-control">' +
							'<option value="" disabled selected>Select Unit</option>' +
							strOption +
						'</select>';

				$( options.selector + ' ' + options.unit_selector ).replaceWith( strHTML );

				$(options.selector + ' ' + options.unit_selector).change( function(e) {
					options.onChange()
				});
			}	
		}
	});
	
}

var Units = function() {
		
	var bindEssentials = function() {
		$('#unit_create #trade_id, #unit_create #year_or_semester_no').change(function( e ) {
			viewCreateUnit();
		});
		
		handleDatatables();
	}
	
	var viewCreateUnit = function() {
		sch.ajaxRequest({
			'page': 'sch-units',
			'pageAction': 'view_create_unit',
			'selector': '#unit_create_form',
			data:  { 'trade_id': $('#trade_id').val(), 'year_or_semester_no': $('#year_or_semester_no').val(), 'batch_id': $('#batch_id').val() },
			success: function( res ) {
				$('#unit_create_form').replaceWith(res);
			}
		});
	}
	
	return {
		bindEssentials: bindEssentials
	}
}

/** Handling Subjects Module **/
var Subject = function() {
	var updateFilter = function(){
		sch.ajaxRequest({
			'page': 'sch-subjects-new',
			'pageAction': '',
			'selector': '#view_subjects',
			data:  { 'trade_id': $('#trade_id').val(), 'year_or_semester_no': $('#year_or_semester_no').val() },
			success: function( res ) {
				$('#view_subjects').replaceWith(res);
			}
		});
	};
	
	var bindFilter = function() {
		$( '#subject_form #trade_id, #subject_form #year_or_semester_no' ).change( function(e) {
			updateFilter();
		});
		
		handleDatatables();

	};
	
	var bindviewCreateSubjects = function() {
		$( '#subject_create #trade_id' ).change( function(e) {
			viewCreateSubject();
		});
		
		$('#submit_subject').click(function() {
			addSubject();
		});
	}
	
	var viewCreateSubject = function() {
		sch.ajaxRequest({
			'page': 'sch-subjects-new',
			'pageAction': 'view_create_subject',
			'selector': '#subject_create_form',
			data:  { 'trade_id': $('#trade_id').val() },
			success: function( res ) {
				$('#subject_create_form').replaceWith(res);
			}
		});
	}
	
	var addSubject = function() {
		sch.ajaxRequest({
			'page': 'sch-subjects-new',
			'pageAction': 'add_subject',
			'selector': '#subject_create_form',
			data:  { 
				'trade_id': $('#trade_id').val(), 
				'year_or_semester_no': $('#year_or_semester_no').val(), 
				'sub_name': $('#subject_name').val(), 
				'sub_code': $('#subject_code').val()
			},
			success: function( res ) {
				$('#subject_create_form').replaceWith(res);
			}
		});
	}
	
	return {
		bindFilter: bindFilter,
		bindviewCreateSubjects: bindviewCreateSubjects
	}
	
};

/** Handling datatables */

function handleDatatables() {

$('.wpsp-table').dataTable({
	language: {
		paginate: {
        next: '<i class="fa fa-angle-double-right" aria-hidden="true"></i>',
        previous: '<i class="fa fa-angle-double-left" aria-hidden="true"></i>'
    },
    	search: "",
    	searchPlaceholder: "Search..."
    },
    "dom": '<"wpsp-dataTable-top"f>rt<"wpsp-dataTable-bottom"<"wpsp-length-info"li>p<"clear">>',
    "order": [],
    "columnDefs": [{
    	"targets": 'nosort',
    	"orderable": false,
    }],
    drawCallback: function(settings) {
    	var pagination = $(this).closest('.dataTables_wrapper').find('.dataTables_paginate');
    	pagination.toggle(this.api().page.info().pages > 1);
    },
    responsive: true
});

}