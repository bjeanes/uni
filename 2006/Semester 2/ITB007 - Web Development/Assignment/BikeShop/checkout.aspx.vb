Imports System.Data
Imports System.Data.OleDb

Partial Class checkout
    Inherits System.Web.UI.Page

    Dim sCart As New ShoppingCart()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Initialise the sCart shopping cart
        sCart.GetCart()
        ' Make sure user is logged in, and redirect to login page if not
        If Session("LoginUsername") = "" Then
            Session("LoginRedirect") = Request.ServerVariables("SCRIPT_NAME")
            Response.Redirect("~/Login.aspx")
        ElseIf sCart.IsCartEmpty() Then
            Response.Redirect("~/shoppingcart.aspx")
        End If
    End Sub

    Protected Sub Step1ContinueLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Step1ContinueLinkButton.Click
        'find out which shipping method is checked
        Dim methodID As Integer
        If PickupRadioButton.Checked Then
            methodID = 0
        Else
            methodID = ddlShippingMethod.SelectedValue
        End If
        'store shipping method id in session variable
        Session("OrderShippingMethod") = methodID

        Step1Div.Visible = False
        Step2Div.Visible = True
    End Sub

    Protected Sub Step2ContinueLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Step2ContinueLinkButton.Click
        'find out which payment method is selected (will always be cash at the moment)
        Dim paymentMethod As String
        If CashRadioButton.Checked Then
            paymentMethod = "Cash"
        Else
            paymentMethod = "CreditCard"
        End If
        'store payment method in session variable
        Session("PaymentMethod") = paymentMethod
        RetrieveOrderDetails()
        Step2Div.Visible = False
        Step3Div.Visible = True
    End Sub

    Private Sub RetrieveOrderDetails()
        'display products
        Dim productsTable As DataTable = sCart.GetDataTable()
        ProductListGridView.DataSource = productsTable
        ProductListGridView.DataBind()
        ProductSubTotalLabel.Text = Session("ShowPrice")

        'display shipping information from database using shipping method id selected
        Dim shippingMethodID As Integer = Session("OrderShippingMethod")
        Dim shippingMethodPrice As Double = 0
        If shippingMethodID > 0 Then
            Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
            Dim dbConn As New OleDbConnection(connString)
            Dim SelectMethodQuery As String = "SELECT * FROM ShippingMethods WHERE [MethodID] = ?"
            Dim SelectMethodAdapter As New OleDbDataAdapter(SelectMethodQuery, dbConn)
            SelectMethodAdapter.SelectCommand.Parameters.Add("MethodID", OleDbType.Numeric).Value = shippingMethodID
            Dim MethodDataTable As New DataTable()
            SelectMethodAdapter.Fill(MethodDataTable)
            ShippingMethodLabel.Text = MethodDataTable.Rows(0).Item("MethodName")
            shippingMethodPrice = MethodDataTable.Rows(0).Item("MethodPrice")
            ShippingCostLabel.Text = String.Format("{0:C}", shippingMethodPrice)
            ShippingSubTotalLabel.Text = String.Format("{0:C}", shippingMethodPrice)
        Else
            ShippingMethodLabel.Text = "Pick Up"
            ShippingCostLabel.Text = "$0"
            ShippingSubTotalLabel.Text = "$0"
            shippingMethodPrice = 0
        End If

        'display payment information
        Dim paymentMethod As String = Session("PaymentMethod")
        PaymentMethodLabel.Text = paymentMethod

        'display order total
        Dim totalItems As Integer = sCart.GetCount()
        Dim totalPrice As Double = Session("TotalPrice") + shippingMethodPrice
        Dim totalDisplay As String = "Total of "
        If totalItems > 1 Then
            totalDisplay += totalItems.ToString() & " items with a total price of " & String.Format("{0:C}", totalPrice)
        Else
            totalDisplay += totalItems.ToString() & " item with a total price of " & String.Format("{0:C}", totalPrice)
        End If
        OrderTotalsLabel.Text = totalDisplay
    End Sub

    Protected Sub Step2CancelLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Step2CancelLinkButton.Click
        Step2Div.Visible = False
        Step1Div.Visible = True
    End Sub

    Private Sub SubmitOrder()
        'set up database connection
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
        Dim dbConn As New OleDbConnection(connString)

        'check that quantities do no exceed available stock
        Dim productsTable As DataTable = sCart.GetDataTable()
        Dim productRow As DataRow
        For Each productRow In productsTable.Rows
            Dim SelectQuantityQuery As String = "SELECT [UnitsInStock] FROM Products WHERE [ProductID] = ?"
            Dim SelectQuantityCommand As New OleDbCommand(SelectQuantityQuery, dbConn)
            SelectQuantityCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = productRow("ID")
            Dim unitsInStock As Integer
            Try
                dbConn.Open()
                unitsInStock = SelectQuantityCommand.ExecuteScalar()
                dbConn.Close()
                ' too many units in cart
                If unitsInStock < productRow("Quantity") Then
                    ErrorDiv.Visible = True
                    ErrorLabel.Text = "You have ordered more " & productRow("Product") & " than are in stock." & _
                        " Please adjust your ordered stock to below " & unitsInStock
                    Exit Sub
                End If
            Catch ex As Exception
                ErrorDiv.Visible = True
                ErrorLabel.Text = "Database Connection error - action aborted"
                Exit Sub
            Finally
                If dbConn.State <> ConnectionState.Closed Then
                    dbConn.Close()
                End If
            End Try
        Next

        'variables needed for order insertion
        Dim CustomerID As Integer
        Dim OrderDate As Date = Date.Today
        Dim ShipDate As Date = OrderDate.AddDays(14)
        Dim shippingMethodID As Integer = Session("OrderShippingMethod")

        Dim CustomerSelectQuery As String = "SELECT [CustomerID] FROM Customers WHERE [UserName] = ?"
        Dim customerSelectCommand As New OleDbCommand(CustomerSelectQuery, dbConn)
        customerSelectCommand.Parameters.Add("Username", OleDbType.VarChar).Value = Session("LoginUsername")

        'find the customer id
        Try
            dbConn.Open()
            CustomerID = customerSelectCommand.ExecuteScalar()
            dbConn.Close()
        Catch ex As Exception
            ErrorDiv.Visible = True
            ErrorLabel.Text = "Database Connection error - action aborted"
            Exit Sub
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Open()
            End If
        End Try

        ' set up Orders Table insertion query
        Dim OrdersInsertQuery As String
        If shippingMethodID = 0 Then
            OrdersInsertQuery = "INSERT INTO Orders ([ShipDate], [OrderDate], [CustomerID], [StatusID]) VALUES (?,?,?,?)"
        Else
            OrdersInsertQuery = "INSERT INTO Orders ([ShipDate], [ShippingMethodID], [OrderDate], [CustomerID], [StatusID]) VALUES (?,?,?,?,?)"
        End If

        Dim OrdersInsertCommand As New OleDbCommand(OrdersInsertQuery, dbConn)

        If shippingMethodID = 0 Then
            OrdersInsertCommand.Parameters.Add("ShipDate", OleDbType.Date).Value = ShipDate
            OrdersInsertCommand.Parameters.Add("OrderDate", OleDbType.Date).Value = OrderDate
            OrdersInsertCommand.Parameters.Add("CustomerID", OleDbType.Numeric).Value = CustomerID
            OrdersInsertCommand.Parameters.Add("StatusID", OleDbType.Numeric).Value = 1
        Else
            OrdersInsertCommand.Parameters.Add("ShipDate", OleDbType.Date).Value = ShipDate
            OrdersInsertCommand.Parameters.Add("ShippingMethodID", OleDbType.Numeric).Value = shippingMethodID
            OrdersInsertCommand.Parameters.Add("OrderDate", OleDbType.Date).Value = OrderDate
            OrdersInsertCommand.Parameters.Add("CustomerID", OleDbType.Numeric).Value = CustomerID
            OrdersInsertCommand.Parameters.Add("StatusID", OleDbType.Numeric).Value = 1
        End If

        'try to insert orders into the database
        Dim insertedOrderID As Integer
        Try
            dbConn.Open()
            insertedOrderID = OrdersInsertCommand.ExecuteScalar()
            dbConn.Close()
        Catch ex As Exception
            ErrorDiv.Visible = True
            ErrorLabel.Text = "Database Connection error - action aborted"
            Exit Sub
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try

        'select last inserted order
        Dim SelectMaxOrderQuery As String = "SELECT max([OrderID]) FROM Orders"
        Dim SelectMaxOrderCommand As New OleDbCommand(SelectMaxOrderQuery, dbConn)
        Try
            dbConn.Open()
            insertedOrderID = SelectMaxOrderCommand.ExecuteScalar()
            dbConn.Close()
        Catch ex As Exception
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try

        'find out products and quantities, and insert into Orders_Products table
        'update quantities in products table
        Dim numberRowsInserted, numberRowsUpdated As Integer
        For Each productRow In productsTable.Rows
            Dim productID As Integer = productRow("ID")
            Dim quantity As Integer = productRow("Quantity")
            Dim sellPrice As Double = productRow("ItemTotal")

            Dim InsertOrderProductsQuery As String = "INSERT INTO Orders_Products ([OrderID], [ProductID], [Quantity], [SellPrice]) VALUES (?,?,?,?)"
            Dim InsertOrderProductsCommand As New OleDbCommand(InsertOrderProductsQuery, dbConn)
            InsertOrderProductsCommand.Parameters.Add("OrderID", OleDbType.Numeric).Value = insertedOrderID
            InsertOrderProductsCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = productID
            InsertOrderProductsCommand.Parameters.Add("Quantity", OleDbType.Numeric).Value = quantity
            InsertOrderProductsCommand.Parameters.Add("SellPrice", OleDbType.Numeric).Value = sellPrice

            Dim UpdateQuantityQuery As String = "UPDATE Products SET [UnitsInStock] = ([UnitsInStock] - ?) WHERE [ProductID] = ?"
            Dim UpdateQuantityCommand As New OleDbCommand(UpdateQuantityQuery, dbConn)
            UpdateQuantityCommand.Parameters.Add("UnitsInStock", OleDbType.Numeric).Value = quantity
            UpdateQuantityCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = productID
            Try
                dbConn.Open()
                numberRowsInserted += InsertOrderProductsCommand.ExecuteNonQuery()
                numberRowsUpdated += UpdateQuantityCommand.ExecuteNonQuery()
                dbConn.Close()
            Catch ex As Exception
                ErrorDiv.Visible = True
                ErrorLabel.Text = "Database Connection error - action aborted"
                Exit Sub
            Finally
                If dbConn.State <> ConnectionState.Closed Then
                    dbConn.Close()
                End If
            End Try
        Next

        'check that number rows = productsTable.rows.count
        'indicating no error
        If numberRowsInserted = productsTable.Rows.Count Then
            sCart.EmptyCart()
            Response.Redirect("~/orderconfirmation.aspx?OrderID=" & insertedOrderID.ToString())
        Else
            ErrorDiv.Visible = True
            ErrorLabel.Text = "There was an error with your order - please try again"
        End If
    End Sub

    Protected Sub ConfirmLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ConfirmLinkButton.Click
        SubmitOrder()
    End Sub

    Protected Sub Step3BackLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Step3BackLinkButton.Click
        Step2Div.Visible = True
        Step3Div.Visible = False
    End Sub

    Protected Sub CancelOrderLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelOrderLinkButton.Click
        Response.Redirect("~/shoppingcart.aspx")
    End Sub
End Class
