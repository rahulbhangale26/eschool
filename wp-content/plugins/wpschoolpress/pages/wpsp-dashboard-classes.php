<?php 
    global $objUser;
    $arrobjUnits        = CUnits::getInstance()->fetchUnitByUser( $objUser, false );
    $arrobjTempTrades   = CTrade::getInstance()->fetchAllTrades();
    
    $arrobjTrades = [];
    foreach ( $arrobjTempTrades AS $objTrade ) {
        $arrobjTrades[$objTrade->id] = $objTrade;
    }
    
?>

<div class="wpsp-card-body">
	<table class="wpsp-table" id="class_table" cellspacing="0" width="100%" style="width:100%">
		<thead>
			<tr>
				<th>Trades</th>
				<th>Unit Name</th>
				<th>Online Class Room</th>
			</tr>
		</thead>
		<tbody>
			<?php 
			    foreach ( $arrobjUnits as $objUnit ) {
				   echo '<tr class="pointer">
                               <td>' . ( true == isset( $arrobjTrades[$objUnit->trade_id] ) ? $arrobjTrades[$objUnit->trade_id]->name : '' ) . '</td>
                               <td>' . $objUnit->unit_name . '</td>
                               <td><a target="__blank" class="wpsp-btn wpsp-btn-success" href="' . ESCHOOL_CLASS_ROOM_BASE_URL .  preg_replace('/[^A-Za-z0-9\-]/', '', str_replace('-', '', $objUnit->unit_name ) . $objUnit->id ) . '">' . ( CRole::TEACHER == $objUser->getRole() ? 'Begin' : 'Join' ) . '</a></td>
                         </tr>';
			     }
            ?>
		</tbody>
	</table>
</div>