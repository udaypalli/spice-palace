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
  <title>Payment</title>
  <link rel="stylesheet" href="css/eipay.css">
  <link rel="icon" type="image/png" href="../images/logo.png">

</head>

<body>
  <div class="container">
    <div class="brand-logo"></div>
    <div class="brand-title">Spice Palace</div>
    <?php
    $_SESSION['fail'] = "Your Payment of RS " . $amount . " failed" . "<br>Please Try Again";
    header('location:' . SITEURL . 'payment-fail-redir.php');
    ?>
  </div>
</body>

</html>