<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Gateway</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            padding: 20px;
        }

        .payment-form {
            background-color: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input,
        select,
        button {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Process payment data and redirect to success page
        $tran_id = $_POST["tran_id"]; // Function to generate a unique transaction ID
        $amount_original = $_POST["amount"];
        $cus_name = $_POST["cus_name"];
    }
    ?>
    <div class="payment-form">

        <form action="redirect.php" method="POST" onsubmit="return validateForm();">

            <div class="form-group">
                <label for="card_type">Select Payment Method:</label>
                <select id="card_type" name="card_type">
                    <option value="debit_card">Debit Card</option>
                    <option value="upi">UPI</option>
                </select>
            </div>

            <div class="form-group" id="debitCardFields">
                <label for="card_number">Card Number:</label>
                <input type="text" id="card_number" name="card_number" placeholder="Enter card number">
            </div>

            <div class="form-group" id="expiryFields">
                <label for="exp_date">Expiration Date:</label>
                <input type="date" id="exp_date" name="exp_date">
            </div>

            <div class="form-group" id="cvvFields">
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" placeholder="Enter CVV">
            </div>

            <div class="form-group" id="upiFields" style="display: none;">
                <label for="upi_id">UPI ID:</label>
                <input type="text" id="upi_id" name="upi_id" placeholder="Enter UPI ID">
            </div>
            <input type="hidden" name="tran_id" value="<?php echo $tran_id; ?>">
            <input type="hidden" name="amount" value="<?php echo $amount_original; ?>">
            <input type="hidden" name="cus_name" value="<?php echo $cus_name; ?>">
            <!--<input type="hidden" name="card_type" id="selected_card_type">-->
            <button type="submit" name="submit">Pay Now</button>
        </form>

        <script>
            // Show/hide fields based on selection
            document.getElementById('card_type').addEventListener('change', function() {
                var debitCardFields = document.getElementById('debitCardFields');
                var expiryFields = document.getElementById('expiryFields');
                var cvvFields = document.getElementById('cvvFields');
                var upiFields = document.getElementById('upiFields');

                if (this.value === 'debit_card') {
                    debitCardFields.style.display = 'block';
                    expiryFields.style.display = 'block';
                    cvvFields.style.display = 'block';
                    upiFields.style.display = 'none';
                } else if (this.value === 'upi') {
                    debitCardFields.style.display = 'none';
                    expiryFields.style.display = 'none';
                    cvvFields.style.display = 'none';
                    upiFields.style.display = 'block';
                } else {
                    debitCardFields.style.display = 'none';
                    expiryFields.style.display = 'none';
                    cvvFields.style.display = 'none';
                    upiFields.style.display = 'none';
                }
            });

            function validateCardNumber() {
                var cardNumber = document.getElementById('card_number').value;
                var cardNumberRegex = /^[0-9]{16}$/;

                if (!cardNumberRegex.test(cardNumber)) {
                    alert('Please enter a valid 16-digit card number.');
                    return false;
                }

                return true;
            }

            function validateUpiId() {
                var upiId = document.getElementById('upi_id').value;
                var upiIdRegex = /^[\w.%+-]+@[A-Za-z0-9.-]+$/;

                if (!upiIdRegex.test(upiId)) {
                    alert('Please enter a valid UPI ID.');
                    return false;
                }

                return true;
            }

            function validateForm() {
                var selectedPaymentMethod = document.getElementById('card_type').value;

                if (selectedPaymentMethod === 'debit_card') {
                    return validateCardNumber();
                } else if (selectedPaymentMethod === 'upi') {
                    return validateUpiId();
                }

                // Additional conditions or validations can be added if needed

                return false; // Default case if no specific condition is met
            }
        </script>
    </div>
</body>

</html>