<%@ Page Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="orders.aspx.vb" Inherits="Admin_orders" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1"
        Height="52px" Style="z-index: 100; left: 4px; position: relative; top: 9px"
        Width="567px" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" SortExpression="OrderID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="SellPrice" HeaderText="Price" SortExpression="SellPrice" />
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
            <asp:BoundField DataField="MethodName" HeaderText="Shipping Method" SortExpression="MethodName" />
            <asp:BoundField DataField="StatusName" HeaderText="Status" SortExpression="StatusName" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
        SelectCommand="SELECT Orders.OrderID, Orders.CustomerID, Products.ProductName, Orders_Products.Quantity, Orders_Products.SellPrice, Orders.OrderDate, ShippingMethods.MethodName, Status.StatusName  FROM (((((Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID) INNER JOIN Status ON Orders.StatusID = Status.StatusID) INNER JOIN Orders_Products ON Orders.OrderID = Orders_Products.OrderID) INNER JOIN Products ON Orders_Products.ProductID = Products.ProductID) INNER JOIN ShippingMethods ON Orders.ShippingMethodID = ShippingMethods.MethodID)">
    </asp:AccessDataSource>
</asp:Content>

