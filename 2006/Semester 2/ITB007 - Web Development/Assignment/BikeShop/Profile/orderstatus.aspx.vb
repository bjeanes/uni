Imports System.Data
Imports System.Data.OleDb

Partial Class orderstatus
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("LoginUsername") = "" Then
            Session("LoginRedirect") = Request.ServerVariables("SCRIPT_NAME")
            Response.Redirect("~\Login.aspx")
        End If

        If Not Page.IsPostBack Then
            DisplayOrders()
        End If
    End Sub

    Private Sub DisplayOrders()
        'create db connection
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
        Dim dbConn As New OleDbConnection(connString)

        'retrieve customer id
        Dim customerID As Integer
        Dim SelectCustomerIDCommand As New OleDbCommand("SELECT [CustomerID] FROM Customers WHERE [UserName] = ?", dbConn)
        SelectCustomerIDCommand.Parameters.Add("UserName", OleDbType.VarChar).Value = Session("LoginUsername")
        Try
            dbConn.Open()
            customerID = SelectCustomerIDCommand.ExecuteScalar()
            dbConn.Close()
        Catch ex As Exception
            ErrorLabel.Text = ex.Message
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try

        'information to display:
        'order num, order date, status, estimated shipping date, product name(s)

        'retrieve all orders and store in table
        Dim OrdersSelectQuery As String = _
            "SELECT [OrderID], [OrderDate], [StatusName], [ShipDate] FROM Orders INNER JOIN Status ON Orders.[StatusID] = Status.[StatusID] WHERE [StatusName] in ('Processing','Shipping')"
        Dim OrdersDataAdapter As New OleDbDataAdapter(OrdersSelectQuery, dbConn)
        Dim OrdersTable As New DataTable()
        OrdersDataAdapter.Fill(OrdersTable)
        OrdersTable.Columns.Add("Products")

        'select a list of products for each order
        For Each OrderRow As DataRow In OrdersTable.Rows
            'find current order id, used in product select query
            Dim CurrentOrderID As Integer = OrderRow.Item("OrderID")
            Dim ProductListQuery As String = "SELECT [ProductName] FROM Products INNER JOIN Orders_Products ON Products.[ProductID] = Orders_Products.[ProductID] WHERE [OrderID] = " & CurrentOrderID
            Dim ProductsDataAdapter As New OleDbDataAdapter(ProductListQuery, dbConn)
            'ProductsDataAdapter.SelectCommand.Parameters.Add("OrderID", OleDbType.Numeric).Value = CurrentOrderID
            Dim productsTable As New DataTable()
            ProductsDataAdapter.Fill(productsTable)

            Dim productsString As String = ""
            If productsTable.Rows.Count > 1 Then
                For i As Integer = 0 To productsTable.Rows.Count - 1
                    Dim productItem As DataRow = productsTable.Rows(i)
                    productsString += productItem("ProductName")
                    If Not i = productsTable.Rows.Count - 1 Then
                        productsString += ", "
                    End If
                Next
            Else
                productsString = productsTable.Rows(0).Item("ProductName")
            End If

            OrderRow("Products") = productsString
        Next

        OrdersRepeater.DataSource = OrdersTable
        OrdersRepeater.DataBind()
    End Sub
End Class
