<?php
$table = 'coa';
$primaryKey = 'id';
$columns = array(
    array( 'db' => 'id', 'dt' => 0 ),
    array( 'db' => 'no_perkiraan',  'dt' => 1 ),
    array( 'db' => 'nama', 'dt' => 2 ),
);
$sql_details = array(
    'user' => 'root',
    'pass' => '',
    'db'   => 'test',
    'host' => 'localhost'
);

require( 'Datatables_ssp.php' );
echo json_encode(Datatables_ssp::simple( $_GET, $sql_details, $table, $primaryKey, $columns ));

