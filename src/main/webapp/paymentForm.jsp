<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    body {
      font-family: Arial;
      font-size: 17px;
      padding: 8px;
    }

    * {
      box-sizing: border-box;
    }

    .row {
      display: -ms-flexbox;
      /* IE10 */
      display: flex;
      -ms-flex-wrap: wrap;
      /* IE10 */
      flex-wrap: wrap;
      margin: 0 -16px;
    }

    .col-25 {
      -ms-flex: 25%;
      /* IE10 */
      flex: 25%;
    }

    .col-50 {
      -ms-flex: 50%;
      /* IE10 */
      flex: 50%;
    }

    .col-75 {
      -ms-flex: 75%;
      /* IE10 */
      flex: 75%;
    }

    .col-25,
    .col-50,
    .col-75 {
      padding: 0 16px;
    }

    .container {
      background-color: #f2f2f2;
      padding: 5px 20px 15px 20px;
      border: 1px solid lightgrey;
      border-radius: 3px;
    }

    input[type=text] {
      width: 100%;
      margin-bottom: 20px;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    input[type=password] {
      width: 100%;
      margin-bottom: 20px;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    label {
      margin-bottom: 10px;
      display: block;
    }

    .icon-container {
      margin-bottom: 20px;
      padding: 7px 0;
      font-size: 24px;
    }

    .btn {
      background-color: #eda92c;
      color: white;
      padding: 12px;
      margin: 10px 0;
      border: none;
      width: 100%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
    }

    .btn:hover {
      background-color: white;
      color: #eda92c;
      border: #eda92c;
    }

    a {
      color: #2196F3;
    }

    hr {
      border: 1px solid lightgrey;
    }

    span.price {
      float: right;
      color: grey;
    }

    label {
      display: inline;
    }

    /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
    @media (max-width: 800px) {
      .row {
        flex-direction: column-reverse;
      }

      .col-25 {
        margin-bottom: 20px;
      }
    }
  </style>
  <script>
  if(window.history.forward(1) !=null)
	  window.history.forward(1);
  </script>
</head>

<body>

  <h2>Payment Form</h2>
  <%
  String email=session.getAttribute("email").toString();
  int total=0;
  int sno=0;
  try
  {
  	Connection con=ConnectionDatabase.createConnection();
  	Statement st = con.createStatement();
  	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
  	while(rs1.next()){
  		total=rs1.getInt(1);
  	}

  %>
  <h4><b>Total:</b><i class="fa fa-inr"></i><%out.println(total); %></h4>
  <table class="table" style="background-color:#fac664 ; margin:20px">
  <thead>
    <tr>
      <th scope="col">S.no</th>
      <th scope="col">Pizza Name</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Sub total</th>
    </tr>
  </thead>
  <tbody>
  <%
            ResultSet rs=st.executeQuery("select * from pizza_items inner join cart on pizza_items.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
            while(rs.next()){
            	
            %>
    <tr>
    <%sno=sno+1; %>
      <th scope="row"><%out.println(sno); %></th>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><%=rs.getString(4) %></td>
      <td><%=rs.getString(9) %></td>
      <td><%=rs.getString(11) %></td>
    </tr>
     
   <%}
            
     ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
     while(rs2.next())
     {
     %>
   
  </tbody>
</table>
<form action="paymentFormAction.jsp?total=<%=total %>" method="post">
  <div class="row">
    <div class="col-75">
      <div class="container"> 
        

          <div class="row">
            <div class="col-50">
              <h3>Billing Address<i>(*all the details will also change in your profile*)</i></h3>
              <label for="fname"><i class="fa fa-user"></i> First Name</label>
              <input type="text" id="fname" name="fname" value="<%=rs2.getString(1) %>" placeholder="Name" required>
               <label for="fname"><i class="fa fa-user"></i> Last Name</label>
              <input type="text" id="lname" name="lname" value="<%=rs2.getString(2) %>" placeholder="Name" required>
              <label for="email"><i class="fa fa-envelope"></i> Email</label>
              <input type="text" id="email" name="email" value="<%=rs2.getString(3) %>" placeholder="Name@example.com" required disabled>
              <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
              <input type="text" id="adr" name="address"  placeholder="address" required>
              <label for="city"><i class="fa fa-institution"></i> City</label>
              <input type="text" id="city" name="city" placeholder="City" required>
              <label for="city"><i class="fa fa-phone"></i>Phone number</label>
              <input type="text" id="phone_number" name="phoneNum" value="<%=rs2.getString(5) %>" placeholder="9876543210" required>


              <div class="row">
                <div class="col-50">
                  <label for="state">State</label>
                  <input type="text" id="state" name="state"   placeholder="State" required>
                </div>
               
              </div>
            </div>
            

            <div class="col-50">
              <h3>Payment</h3>
             <!--  <input type="radio" id="male" name="gender" value="male">
              <label for="male">COD</label><br>
              <input type="radio" id="female" name="gender" value="female">
              <label for="female">Wallet</label><br>
              <i class="fa fa-cc-paypal" style="color:navy;font-size:24px;"></i>
              <i class="fa fa-google-wallet" style="font-size:24px;color:gray"></i>
              <i class="fa fa-cc-stripe" style="font-size:24px;color:black;"></i>
              <i class="fa fa-cc-diners-club" style="font-size:24px;color:green;"></i> -->

              <label for="fname">
                <h3>Enter Your Credit Card Details</h3>
              </label>
              <div class="icon-container">
                <i class="fa fa-cc-visa" style="color:navy;"></i>
                <i class="fa fa-cc-amex" style="color:blue;"></i>
                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                <i class="fa fa-cc-discover" style="color:orange;"></i>

              </div>
              <label for="cname">Name on Card</label>
              <input type="text" id="fname" name="fname" value="<%=rs2.getString(1) %>" placeholder="Name" required>
              <label for="ccnum">Credit card number</label>
              <input type="text" id="ccnum" name="cardnumber" value="<%=rs2.getString(9) %>" placeholder="1111-2222-3333-4444" required>
              <label for="expmonth">Exp Month</label>
              <input type="text" id="expmonth" name="expmonth" placeholder="Month" value="<%=rs2.getString(10) %>"  required>
              <div class="row">
                <div class="col-50">
                  <label for="expyear">Exp Year</label>
                  <input type="text" id="expyear" name="expyear" value="<%=rs2.getString(11) %>" placeholder="20__" required>
                </div>
                <div class="col-50">
                  <label for="cvv">CVV</label>
                  <input type="password" id="cvv" name="cvv" placeholder="XXX" required>
                </div>
              </div>
            </div>

          </div>
          <label>
            <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
          </label>

          <button class="btn" type="submit">Proceed To Checkout</button>

          <a href="cart.jsp"><button class="btn" type="button">Return To Cart</button></a>
		
      </div>
    </div>
    </form>
    
    <%} }
    catch(Exception e){
    }%>
    
</body>

</html>