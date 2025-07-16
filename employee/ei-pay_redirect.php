<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process payment logic (you can customize this part)
    $paymentSuccessful = true; // Example: For simplicity, consider payment is always successful

    // Retrieve data from the form
    $tran_id = $_POST["tran_id"];
    $amount_original = $_POST["amount"];
    $pay_status = $paymentSuccessful ? "successful" : "failed";
    $pay_time = date("Y-m-d H:i:s");
    $cus_name = $_POST["cus_name"];
    $card_type = $_POST["card_type"];
    $table = $_POST["table_name"];
    // Store data in session
    $_SESSION['payment_data'] = [
        'tran_id' => $tran_id,
        'amount_original' => $amount_original,
        'pay_status' => $pay_status,
        'pay_time' => $pay_time,
        'cus_name' => $cus_name,
        'card_type' => $card_type,
        'table' => $table,
    ];

    // Redirect based on payment status
    if ($paymentSuccessful) {
        header("Location: success.php");
        exit();
    } else {
        header("Location: fail.php");
        exit();
    }
} else {
    // Redirect if accessed directly without form submission
    header("Location: fail.php");
    exit();
}
