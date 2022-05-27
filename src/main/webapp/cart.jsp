<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome -->
    
</head>

<body>
    <!--navbar Section-->
    <div class="container">
        <h1>Shopping Cart</h1>
        <div class="cart">
            <div class="products">
                <div class="product">
                    <img src="img/chillipaneer.png">
                    <div class="product-info">
                        <h3 class="product-name">Chilli Paneer Pizza</h3>
                        <h4 class="product-price"> 319</h4>
                        <p class="product-quantity">Qnt: <input value="1" name="">
                        <p class="product-remove">
                            <i class="fa fa-trash" aria-hidden="true"></i>
                            <span class="remove">Remove</span>
                        </p>
                    </div>
                </div>
                <div class="product">
                    <img src="img/chickentikka.png">
                    <div class="product-info">
                        <h3 class="product-name">Chiken Tikka Pizza</h3>
                        <h4 class="product-price">499</h4>
                        <p class="product-quantity">Qnt: <input value="1" name="">
                        <p class="product-remove">
                            <i class="fa fa-trash" aria-hidden="true"></i>
                            <span class="remove">Remove</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="cart-total">
                <p>
                    <span>Total Price</span>
                    <span>198</span>
                </p>
                <p>
                    <span>Total Items</span>
                    <span>2</span>
                </p>
                <p>
                </p>
                <a href="payment_confirmation.html">Proceed to Checkout</a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
        crossorigin="anonymous"></script>
</body>

</html>