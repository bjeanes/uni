Imports System.Data
Imports System.Data.OleDb

Partial Class orderReceipt
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("OrderID") = "" Then
            Response.Redirect("~/")
        End If
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
        Dim dbConn As New OleDbConnection(connString)

        'dispaly order number
        OrderNumberLabel.Text = Request.QueryString("OrderID")

        'retrieve customer information
        Dim CustomerInformationQuery As String = "SELECT * FROM Customers WHERE [CustomerID] = (SELECT [CustomerID] FROM Orders WHERE [OrderID] = ?)"
        Dim CustomerInformationDataAdapter As New OleDbDataAdapter(CustomerInformationQuery, dbConn)
        CustomerInformationDataAdapter.SelectCommand.Parameters.Add("OrderID", OleDbType.Numeric).Value = Request.QueryString("OrderID")
        Dim CustomerInformationDataTable As New DataTable()
        CustomerInformationDataAdapter.Fill(CustomerInformationDataTable)

        'display customer information
        CustomerFirstNameLabel.Text = CustomerInformationDataTable.Rows(0).Item("GivenName").ToString()
        CustomerLastNameLabel.Text = CustomerInformationDataTable.Rows(0).Item("FamilyName").ToString()

        'retrieve product information
        Dim ProductInformationQuery As String = "SELECT [ProductName], [Quantity], [SellPrice] FROM Products INNER JOIN Orders_Products ON Products.[ProductID] = Orders_Products.[ProductID] WHERE Orders_Products.[OrderID] = ?"
        Dim ProductInformationDataAdapter As New OleDbDataAdapter(ProductInformationQuery, dbConn)
        ProductInformationDataAdapter.SelectCommand.Parameters.Add("OrderID", OleDbType.Numeric).Value = Request.QueryString("OrderID")
        Dim ProductInformationDataTable As New DataTable()
        ProductInformationDataAdapter.Fill(ProductInformationDataTable)

        'dislpay product information
        ProductsGridView.DataSource = ProductInformationDataTable
        ProductsGridView.DataBind()

        'retrieve order and shipping information
        Dim OrderInformationQuery As String = "SELECT * FROM Orders LEFT JOIN ShippingMethods ON Orders.[ShippingMethodID] = ShippingMethods.[MethodID] WHERE Orders.[OrderID] = ?"
        Dim OrderInformationDataAdapter As New OleDbDataAdapter(OrderInformationQuery, dbConn)
        OrderInformationDataAdapter.SelectCommand.Parameters.Add("OrderID", OleDbType.Numeric).Value = Request.QueryString("OrderID")
        Dim OrderInformationDataTable As New DataTable()
        OrderInformationDataAdapter.Fill(OrderInformationDataTable)

        'display order information
        OrderDateLabel.Text = OrderInformationDataTable.Rows(0).Item("OrderDate")

        If OrderInformationDataTable.Rows(0).Item("ShippingMethodID").ToString <> "" Then
            ShippingMethodLabel.Text = OrderInformationDataTable.Rows(0).Item("MethodName")
        Else
            ShippingMethodLabel.Text = "Pick Up"
        End If

        Dim totalCost As Double
        For Each itemRow As DataRow In ProductInformationDataTable.Rows
            totalCost += itemRow.Item("SellPrice")
        Next
        TotalPriceLabel.Text = String.Format("{0:C}", totalCost)
    End Sub
End Class
