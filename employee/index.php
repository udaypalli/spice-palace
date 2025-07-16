<?php include('config/constants.php'); ?>
<?php
error_reporting(0);
date_default_timezone_set('Asia/Kolkata');
//Generate Unique Transaction ID
function rand_string($length)
{
  $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  $size = strlen($chars);
  for ($i = 0; $i < $length; $i++) {
    $str .= $chars[rand(0, $size - 1)];
  }

  return $str;
}
$cur_random_value = rand_string(10);

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Eat in Payment</title>
  <link rel="stylesheet" href="css/eipay.css">
  <link rel="icon" type="image/png" href="../images/logo.png">

</head>

<body>

  <div class="container">
    <div class="brand-logo"></div>
    <div class="brand-title">Spice Palace</div>

    <form action="ei-pay_process.php" class="inputs" method="POST" name="form1">

      <tr>
        <td>Transaction ID:<br> </td>
        <td><input type="hidden" name="tran_id" value="EI-PAY-<?php echo "$cur_random_value"; ?>">EI-PAY-<?php echo "$cur_random_value"; ?></td>
      </tr>
      <br /><br />

      <label>Enter Amount</label>
      <input type="number" placeholder="" name="amount" value="amount" required>

      <label>Enter Name</label>
      <input type="text" placeholder="" name="cus_name" value="cus_name" required>
      <label>Select Table ID<label>
          <select class="select-css" name="table_name" required>
            <option value="Table 1">Table 1</option>
            <option value="Table 2">Table 2</option>
            <option value="Table 3">Table 3</option>
            <option value="Table 4">Table 4</option>
            <option value="Table 5">Table 5</option>
            <option value="Table 6">Table 6</option>
          </select>
          <input type="hidden" name="success_url" value="<?php echo SITEURL; ?>success.php">
          <input type="hidden" name="fail_url" value="<?php echo SITEURL; ?>fail.php">
          <input type="hidden" name="cancel_url" value="<?php echo SITEURL; ?>/cancel.php">

          <button type="submit" name="submit" value="Pay Now">Pay</button>

    </form>

  </div>

</body>

</html>