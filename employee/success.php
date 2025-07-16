<?php include('config/constants.php'); ?>

<?php
session_start();
$paymentData = $_SESSION['payment_data'] ?? null;
unset($_SESSION['payment_data']);

if ($paymentData) {

  $tran_id = $paymentData['tran_id'] ?? null;
  $amount = $paymentData['amount_original'] ?? null;
  $status = $paymentData['pay_status'] ?? null;
  $pay_time = $paymentData['pay_time'] ?? null;
  $customer_name = $paymentData['cus_name'] ?? null;
  $card_type = $paymentData['card_type'] ?? null;
  $table = $paymentData['table'] ?? null;
  $order_status = "Pending";
} else {

  header("Location: fail-onlpmt.php");
  exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Eat in Payment</title>
  <link rel="stylesheet" href="css/eipay.css">
  <link rel="icon" type="image/png" href="../images/logo_ntx.png">

</head>

<body>


  <div class="container">
    <div class="brand-logo"></div>
    <div class="brand-title">Spice Palace</div>

    <form action="" class="inputs" method="POST" name="form1">
      <p>Your Payment of RS <?php echo $amount; ?> is successful. </p>
      <p>Transaction ID: <?php echo $tran_id; ?>
    </form>
    <?php

    $sql = "INSERT INTO tbl_eipay SET
        amount='$amount',
        tran_id = '$tran_id',
        order_date = '$pay_time',
        payment_status = '$status',
        table_id = '$table',
        order_status = '$order_status'
    
    ";
    $res = mysqli_query($conn, $sql) or die(mysqli_error());

    if ($res == true) {
      $_SESSION['success'] = "Your Payment of RS " . $amount . " is Successful." . "<br/> Transaction ID: " . $tran_id;
      header('location:' . SITEURL . 'payment-redir.php');
    } else {
      $_SESSION['fail'] = "Your Payment of RS " . $amount . " is Not Successful." . "<br/> Transaction ID: " . $tran_id . "Please Try Again";
      header('location:' . SITEURL . 'index.php');
    }


    ?>
    <button class="btn-secondary">Homepage</button>
  </div>

</body>

</html>