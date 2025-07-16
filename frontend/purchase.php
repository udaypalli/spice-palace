<?php include('config/constants.php'); ?>


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


    <?php
    date_default_timezone_set('Asia/Kolkata');
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST['purchase'])) {
            $cur_random_value = $_POST['tran_id'];
            $amount = $_POST['amount'];
            $username = $_POST['username'];
            $cus_name = $_POST['cus_name'];
            $cus_email = $_POST['cus_email'];
            $cus_add1 = $_POST['cus_add1'];
            $cus_city = $_POST['cus_city'];
            $cus_phone = $_POST['cus_phone'];
            $order_date = date("Y-m-d h:i:sa");





            $query1 = "INSERT INTO `order_manager`(`username`,`cus_name`, `cus_email`, `cus_add1`, `cus_city`, `cus_phone`, `payment_status`, `order_date`,`total_amount`,`transaction_id`,`order_status`) VALUES ('$_POST[username]','$_POST[cus_name]','$_POST[cus_email]','$_POST[cus_add1]','$_POST[cus_city]','$_POST[cus_phone]','$_POST[payment_status]','$order_date','$_POST[amount]','$_POST[tran_id]','Pending')";
            if (mysqli_query($conn, $query1)) {
                $Order_Id = mysqli_insert_id($conn);
                $query2 = "INSERT INTO `online_orders_new`(`order_id`, `Item_Name`, `Price`, `Quantity`) VALUES (?,?,?,?)";
                $stmt = mysqli_prepare($conn, $query2);

                if ($stmt) {
                    mysqli_stmt_bind_param($stmt, "isii", $Order_Id, $Item_Name, $Price, $Quantity);

                    foreach ($_SESSION['cart'] as $key => $values) {
                        $Item_Name = $values['Item_Name'];
                        $Price = $values['Price'];
                        $Quantity = $values['Quantity'];
                        $Id = $values['Id'];

                        mysqli_stmt_execute($stmt);




                        $update_quantity_query = "UPDATE `tbl_food` SET
                                         stock = stock - $Quantity
                                         WHERE title = '$Item_Name'
                                         
                                        ";
                        //echo $update_quantity_query;

                        $res_update_quantity_query = mysqli_query($conn, $update_quantity_query);
                    }

                    unset($_SESSION['cart']);

    ?>
                    <form action="process_payment.php" class="inputs" method="POST" name="form1" id="form1">

                        <input type="hidden" name="tran_id" value="<?php echo "$cur_random_value"; ?>">
                        <input type="hidden" name="amount" value="<?php echo $amount; ?>">
                        <input type="hidden" name="cus_name" value="<?php echo $cus_name; ?>">
                        <input type="hidden" name="success_url" value="success-onlpmt.php">
                        <input type="hidden" name="fail_url" value="fail-onlpmt.php">
                        <input type="hidden" name="cancel_url" value="cancel-onlpmt.php">

                        <button type="submit" name="submit" value="Pay Now"></button>
                    </form>

    <?php

                } else {
                    echo "<script>
                alert('SQL Query Prepare Error');
                window.location.href='mycart.php';
                </script>";
                }
            } else {
                echo "<script>
            alert('SQL Error');
            window.location.href='mycart.php';
            </script>";
            }
        }
    }

    ?>
    <script>
        document.addEventListener("DOMContentLoaded", function(event) {
            document.createElement('form').submit.call(document.getElementById('form1'));
        });
    </script>
</body>

</html>