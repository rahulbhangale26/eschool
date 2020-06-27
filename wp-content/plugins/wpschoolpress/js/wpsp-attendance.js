$(document).ready(function() {
	$('#monthly_muster').click( function(e) {
		if( $('#attendance_report_unit').val() == '' ) {
			$('#error_message').html( 'Please select unit.' );
			return false;
		}
		
		if( $('#attendance_report_month').val() == '' ) {
			$('#error_message').html( 'Please select month.' );
			return false;
		}

		if( $('#attendance_report_year').val() == '' ) {
			$('#error_message').html( 'Please select year.' );
			return false;
		}
		
		window.location.href = $('#monthly_muster').attr('data-reportUrl') + '&ViewUnitId=' + $('#attendance_report_unit').val() + '&month=' +  $('#attendance_report_month').val()  + '&year=' + $('#attendance_report_year').val() + '&ViewTradeId=' + $('#ViewTradeId').val();

	});

});

$(document).ready(function() {
	
	$(".clserror").hide(), 
	$(".clsdate").hide(), 
	
	$(document).on("click", ".checkAll", function(e) {
		$(this).prop("checked") && $("input[name=absent\\[\\]]").prop("checked", !1)
		$(this).prop("checked") && $("input[name=cl\\[\\]]").prop("checked", !1)
		$(this).prop("checked") && $("input[name=sl\\[\\]]").prop("checked", !1)
		$(this).prop("checked") && $("input[name=spl\\[\\]]").prop("checked", !1)
	}), 
	
	$(document).on("click", "input[name=absent\\[\\]], input[name=spl\\[\\]], input[name=sl\\[\\]], input[name=cl\\[\\]]", function(e) {
		$(this).prop("checked") && $(".checkAll").prop("checked", !1)
	}), 
	
	$(".select_date").datepicker({
		autoclose: !0,
		dateFormat: date_format,
		todayHighlight: !0,
		changeMonth: !0,
		changeYear: !0,
		maxDate: 0
	}), 
	
	
	$( '.AttendanceView #ViewTradeId' ).change(function(){
		sch.ajaxRequest({
			'page': 'sch-trades',
			'pageAction': 'get_trade_unit_lists',
			'selector': '.attendance-page',
			data:  { 'TradeId': $('.AttendanceView #ViewTradeId').val() },
			success: function( res ) {
				
				if( '' != res ) {
					var units = $.parseJSON( res );
					strOption = '';
					$(units).each( function( index, unit ){
						strOption += '<option value="' + unit.id + '">' + unit.unit_name+ '</option>';
					});
					strHTML = '<select name="ViewUnitId" id = "attendance_report_unit" class="wpsp-form-control">' +
								'<option value="" disabled selected>Select Unit</option>' +
								strOption +
							'</select>';

					$('.AttendanceView #attendance_report_unit').replaceWith( strHTML );
				}	
			}
				
		});
	});
	
	$( '#AttendanceEnterForm #TradeId' ).change(function(){
		sch.ajaxRequest({
			'page': 'sch-trades',
			'pageAction': 'get_trade_unit_lists',
			'selector': '.attendance-page',
			data:  { 'TradeId': $('#AttendanceEnterForm #TradeId').val() },
			success: function( res ) {
				
				if( '' != res ) {
					var units = $.parseJSON( res );
					strOption = '';
					$(units).each( function( index, unit ){
						strOption += '<option value="' + unit.id + '">' + unit.unit_name+ '</option>';
					});
					strHTML = '<select name="UnitId" id = "UnitId" class="wpsp-form-control">' +
								'<option value="" disabled selected>Select Unit</option>' +
								strOption +
							'</select>';

					$('#AttendanceEnterForm #UnitId').replaceWith( strHTML );
				}	
			}
				
		});
	});
	
	$("#AttendanceEnter, #AttendanceEdit").click(function() {
		$("#AttendanceClass").parent().parent().find(".clserror").removeClass("error"), 
		$("#AttendanceClass").parent().parent().find(".clsbatch").removeClass("error"), 
		$("#AttendanceDate").parent().parent().find(".clsdate").removeClass("error"), 
		$("#AddModalContent").html(""), $("#wpsp-error-msg").html("");
		$('.attendance-page').append( '<div class="loaderOverlay"></div><div class="loader"></div>')
		var e = $("#AttendanceClass").val(),
			a = $("#AttendanceDate").val();
		
		var unit_id = $('#UnitId').val();	
		
		if (
				"" == e && ($(".clserror").show(), $("#AttendanceClass").parent().parent().find(".clserror").addClass("error")), 
				"" == a && ($(".clsdate").show(), $("#AttendanceDate").parent().parent().find(".clsdate").addClass("error")), 
				"" == unit_id && ($(".clsbatch").show(), $("#UnitId").parent().parent().find(".clsbatch").addClass("error")), 
				"" != e && "" != a && "" != unit_id ) {
			var t = [];
			t.push({ name: "action", value: "getStudentsList" }, { name: "classid", value: e }, { name: "date", value: a }, { name: 'unit_id', value: unit_id}), 
			
			$.ajax({
				type: "POST",
				url: ajax_url,
				data: t,
				beforeSend: function() {		
					$("#AttendanceEnter").attr("disabled", "disabled")
				},
				success: function(e) {
					$('.attendance-page .loaderOverlay').remove();
		        	$('.attendance-page .loader').remove();
		        	$('#attendance_report').remove();
					$("#AttendanceEnter").removeAttr("disabled");
					var a = jQuery.parseJSON(e);
					0 == a.status ? ($("#wpsp-error-msg").html(a.msg), location.reload(!0)) : $("#AddModalContent").html(a.msg)
							
					$('html, body').animate({
						scrollTop: $(".AddModalContent").offset().top
					}, 2000 );
						 
				},
				error: function() {
					$('.attendance-page .loaderOverlay').remove();
		        	$('.attendance-page .loader').remove();
					$("#AttendanceEnter").removeAttr("disabled"), $(".wpsp-popup-return-data").html("Something went wrong. Try after refreshing page.."), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
				},
				complete: function() {
					$('.attendance-page .loaderOverlay').remove();
		        	$('.attendance-page .loader').remove();
					$("#AttendanceEnter").removeAttr("disabled")
				}
			})
		}
		
	}), 
	
	$(document).on("click", "#AttendanceSubmit", function(e) {

    if (e.preventDefault(), $('input[type="checkbox"]:checked').length > 0) {
      var a = $("#AttendanceEntryForm").serializeArray();
      a.push({
        name: "action",
        value: "AttendanceEntry"
      }), 
      
      jQuery.post(ajax_url, a, function(e) {
    	  "success" == e ? (
    			  $(".wpsp-popup-return-data").html("Attendance entered successfully!"),
    		$("#SuccessModal").css("display", "block"),
    		$("#SavingModal").css("display", "none"),
    		$("#SuccessModal").addClass("wpsp-popVisible"),
    		$("#AttendanceEntryForm").trigger("reset"), 
    		setTimeout(function() {
    			$(".alert").remove(), 
    			$("#SuccessModal").css("display", "none"),
    			$("#Attendanceview").click()
    			window.location.href = $('.attendance-page').attr( 'data-attendancePageUrl' );
        }, 2e3)) : "updated" == e ? ($("#formresponse").html("<div class='alert alert-warning'>Attendance updated successfully!</div>"),
		location.reload(!0)) : ($(".wpsp-popup-return-data").html("Something went "),
		$("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"),
		$("#WarningModal").addClass("wpsp-popVisible"), window.setTimeout(function() {
          $(".alert").fadeTo(500, 0).slideUp(500, function() {
            $(this).remove()
          })
        }, 5e3))
      })
    } else $(".wpsp-popup-return-data").html("If no absent please select Nil at bottom!"), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
  }), $(document).on("click", ".deleteAttendance", function() {
    if (confirm("Are you want to delete this entry?")) {
      var e = $(this).attr("data-id");
      if ($.isNumeric(e)) {
        var a = [];
        a.push({
          name: "action",
          value: "deleteAttendance"
        }, {
          name: "aid",
          value: e
        }), $.ajax({
          type: "POST",
          url: ajax_url,
          data: a,
          beforeSend: function() {},
          success: function(e) {
            $(".wpsp-popup-return-data").html("Attendance entry deleted successfully.."),
			$("#SuccessModal").css("display", "block"),
			$("#SavingModal").css("display", "none"),
			$("#SuccessModal").addClass("wpsp-popVisible")
          },
          error: function() {
            $(".wpsp-popup-return-data").html("Something went wrong. Try after refreshing page.."), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
          },
          complete: function() {
            $(".pnloader").remove()
          }
        })
      } else $(".wpsp-popup-return-data").html("Attendance ID Missing!"), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
    }
  }), $(".viewAbsentees").click(function() {
    var e = $(this).attr("data-id");
    if ($.isNumeric(e)) {
      var a = [];
      a.push({
        name: "action",
        value: "getAbsentees"
      }, {
        name: "classid",
        value: e
      }), $.ajax({
        type: "POST",
        url: ajax_url,
        data: a,
        beforeSend: function() {},
        success: function(e) {
          $("#ViewModalContent").html(e)
        },
        error: function() {
          $(".wpsp-popup-return-data").html("Something went wrong. Try after refreshing page.."), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
        },
        complete: function() {
          $(".pnloader").remove()
        }
      }), $("#ViewModal").modal("show")
    } else $(".wpsp-popup-return-data").html("Class ID Missing.."), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
  }), $(document).on("click", ".viewAbsentDates", function() {
    var e = $(this).attr("data-id");
    if ($.isNumeric(e)) {
      var a = [];
      a.push({
        name: "action",
        value: "getAbsentDates"
      }, {
        name: "sid",
        value: e
      }), $.ajax({
        type: "POST",
        url: ajax_url,
        data: a,
        beforeSend: function() {},
        success: function(e) {
          $("#ViewModalContent").html(e)
        },
        error: function() {
          $(".wpsp-popup-return-data").html("Something went wrong. Try after refreshing page.."), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
        },
        complete: function() {
          $(".pnloader").remove()
        }
      }), $("#ViewModal").modal("show")
    } else $(".wpsp-popup-return-data").html("Class ID Missing.."), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
  }), $(document).on("click", "#Attendanceview", function() {
    $("#AttendanceClass").parent().parent().find(".clserror").removeClass("error"), $("#AttendanceDate").parent().parent().find(".clsdate").removeClass("error"), $("#wpsp-error-msg").html();
    var e = $("#AttendanceClass").val(),
      a = $("#AttendanceDate").val();
    if ("" == e && $("#AttendanceClass").parent().parent().find(".clserror").addClass("error"), "" == a && $("#AttendanceDate").parent().parent().find(".clsdate").addClass("error"), "" != e && "" != a) {
      var t = [];
      t.push({
        name: "action",
        value: "getStudentsAttendanceList"
      }, {
        name: "classid",
        value: e
      }, {
        name: "date",
        value: a
      }), $.ajax({
        type: "POST",
        url: ajax_url,
        data: t,
        beforeSend: function() {
          $("#Attendanceview").attr("disabled", "disabled")
        },
        success: function(e) {
          $("#Attendanceview").removeAttr("disabled");
          var a = jQuery.parseJSON(e);
          0 == a.status ? ($(".wpsp-popup-return-data").html("Something went wrong. Try after refreshing page.."), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")) : $(".AttendanceView").html(a.msg)
        },
        error: function() {
          $("#Attendanceview").removeAttr("disabled"), $(".wpsp-popup-return-data").html("Something went wrong. Try after refreshing page.."), $("#SavingModal").css("display", "none"), $("#WarningModal").css("display", "block"), $("#WarningModal").addClass("wpsp-popVisible")
        },
        complete: function() {
          $("#Attendanceview").removeAttr("disabled")
        }
      })
    }
  }), $("#verticalTab").easyResponsiveTabs({
    type: "vertical",
    width: "auto",
    fit: !0
  }), $(window).width() < 991 && ($("#verticalTab").find(".wpsp-resp-tab-active").removeClass("wpsp-resp-tab-active"), $("#verticalTab").find(".wpsp-resp-tab-content-active").removeClass("wpsp-resp-tab-content-active").css("display", "")), jQuery(window).width() < 991 && ($("#verticalTab").find(".wpsp-resp-tab-active").length || $(".wpsp-resp-tabs-list .wpsp-resp-tab-item:first-child").click())
}), jQuery(window).resize(function() {
  jQuery(window).width() > 991 && ($("#verticalTab").find(".wpsp-resp-tab-active").length || $(".wpsp-resp-tabs-list .wpsp-resp-tab-item:first-child").click())
});
