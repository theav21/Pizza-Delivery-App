<%@ include file="header.jsp" %>
<%@page import="com.db.connection.ConnectionDatabase"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome -->
    
</head>

<body>
<%
int total = 0;
int quantity=0;
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
    <!--navbar Section-->
    <div class="container">
        <h1>Shopping Cart</h1>
        <div class="cart">
            <div class="products">
            <%
            ResultSet rs=st.executeQuery("select * from pizza_items inner join cart on pizza_items.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
            while(rs.next()){
            	quantity += rs.getInt(9);
            %>
                <div class="product">
                    <img src="img/<%= rs.getString(6) %>.png">
                    <div class="product-info">
                        <h6 class="product-name"><b>Name Of Item</b> :<%=rs.getString(2) %></h6>
                        
                        
                        <h6 class="product-price"><b>Category</b> : <%=rs.getString(3) %></h6>
                        <h6 class="product-price"><b>Price</b> : <i class="fa fa-inr"></i><%=rs.getString(4) %></h6>
                        <h6 class="product-quantity"><b>Quantity</b> : <a href="incDecQuantity.jsp?id=<%= rs.getString(1)%>&quantity=inc"><i class = 'fas fa-plus-circle'></i></a><%=rs.getString(9) %> <a href="incDecQuantity.jsp?id=<%= rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></h6>
                    	<h6 class="product-price"><b>SubTotal</b> : <i class='fa fa-inr'></i> <%=rs.getString(11) %></h6>      
                                 
                        <p class="product-remove">
                            <i class="fa fa-trash" aria-hidden="true"></i>
                            <span class="remove"><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove</a></span>
                        </p>
                    </div>
                </div>
                <%
            }

                %>

            </div>
            <div class="cart-total">
                <p>
                    <span>Total Price</span>
                    <span><i class = "fa fa-inr"></i><%out.println(total); %></span>
                </p>
                <p>
                    <span>Total Items</span>
                    <span><%out.println(quantity);%></span>
                </p>
                <p>
                </p>
                <%if(total>0){ %>
                <a href="paymentForm.jsp">Proceed to Checkout</a>
            	<%} %>
            </div>
        </div>
    </div>
    <%  }
catch(Exception e){
	
}%>
   
</body>

</html>