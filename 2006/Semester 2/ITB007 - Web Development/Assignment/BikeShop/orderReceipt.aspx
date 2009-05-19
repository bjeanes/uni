<%@ Page Language="VB" AutoEventWireup="false" CodeFile="orderReceipt.aspx.vb" Inherits="orderReceipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Order Receipt</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 style="text-align:center">The Bike Shop</h1>
        <h2>Order Receipt for <asp:Label ID="CustomerFirstNameLabel" runat="server"></asp:Label> 
        <asp:Label ID="CustomerLastNameLabel" runat="server"></asp:Label></h2>
        <p><b>Order Number:</b> #<asp:Label id="OrderNumberLabel" runat="server"></asp:Label></p>
        <p>
            <b>Order Date:</b> <asp:Label ID="OrderDateLabel" runat="server"></asp:Label></p>
        <p><b>Purchase of the following items:</b></p>
        <asp:GridView ID="ProductsGridView" runat="server"></asp:GridView><br />
        <p><b>Shipping method:</b> <asp:Label ID="ShippingMethodLabel" runat="server"></asp:Label></p>
        <p><b>Total Price:</b> <asp:Label ID="TotalPriceLabel" runat="server"></asp:Label></p>
    </div>
    </form>
</body>
</html>
