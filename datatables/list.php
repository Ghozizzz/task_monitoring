<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title> SSP </title>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
 </head>
 <body>
    <table id="datalist">
      <thead>
        <tr>
        <td>ID</td>
        <td>COA</td>
        <td>COA Name</td>
        </tr>
      </thead>
    </table>
<script type="text/javascript">
<!--
$('document').ready(function() {
  $('#datalist').DataTable
  ({
      "processing": true,
      "serverSide": true,
      "ajax": "control.php"
  });
});
//-->
</script>
 </body>
</html>