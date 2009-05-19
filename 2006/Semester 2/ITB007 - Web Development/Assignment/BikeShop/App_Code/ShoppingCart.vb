' Shopping Cart based on example given on OLT
' Written by Trevor Taylor, Modified by On Wong
' Further modified by Jeff Burn for purposes of ITB007 Team016
Imports Microsoft.VisualBasic
Imports System.Web.HttpContext
Imports System.Data
Imports System.Data.OleDb

Public Class ShoppingCart

    ' This global variable holds the Cart data table.
    ' It is stored in a Session Variable so it can be passed
    ' between pages, but all the pages must call the GetCart()
    ' routine to retrieve it from the Session Variable.
    Dim Cart As DataTable

    ' CreateCart() -- Create a new Shopping Cart
    ' Sets the global variable and sets all session variables too.
    ' Parameters: No parameters.
    ' Returns: Nothing.
    ' Side-Effects:
    '       Updates Cart global variable.
    '       Sets the Session variables ShoppingCart, TotalPrice and ShowPrice.
    ' NOTE: Any previous Cart (if there is one) is lost!
    Public Sub CreateCart()
        Cart = New DataTable
        ' Add columns to the new DataTable
        Cart.Columns.Add(New DataColumn("ID", GetType(Integer)))
        Cart.Columns.Add(New DataColumn("Product", GetType(String)))
        Cart.Columns.Add(New DataColumn("Price", GetType(Double)))
        Cart.Columns.Add(New DataColumn("Quantity", GetType(Integer)))
        Cart.Columns.Add(New DataColumn("ItemTotal", GetType(Double)))
        ' Save the cart into a session variable for later
        HttpContext.Current.Session("ShoppingCart") = Cart
        ' Set the other session variables too
        HttpContext.Current.Session("TotalPrice") = 0
        HttpContext.Current.Session("ShowPrice") = FormatCurrency(0)
    End Sub

    ' GetCart() -- Retrieves the Cart from the Session variable
    ' This routine must be called in the Page_Load so that the
    ' Cart will be populated from the Session Variable.
    ' If there is no Cart, then a new one is created.
    ' Parameters: No parameters.
    ' Returns: Nothing.
    ' Side-Effects: Updates Cart global variable.
    Public Sub GetCart()
        ' See if the cart exists already
        If HttpContext.Current.Session("ShoppingCart") Is Nothing Then
            ' Shopping Cart does not exist so create one now
            CreateCart()
        Else
            ' Cart already exists, so get it back from the session variable
            Cart = HttpContext.Current.Session("ShoppingCart")
        End If
    End Sub

    ' AddToCart() -- Adds an item to the cart
    ' This is the Add command. It adds one item to the Cart table.
    ' This method takes an ItemID parameter, and uses this to look up
    ' the product in the database, and then add its details to the 
    ' cart table.
    ' Parameters: ItemID as String
    ' Returns: True if successful
    '          False if not (product doesn't exist in DB or ItemID not appropriate)
    ' Side-Effects: Cart is updated. Session variables updated
    Public Function AddToCart(ByVal ItemID As String) As Boolean
        ' Make sure the Cart exists
        If Not Cart Is Nothing Then
            ' set up for reading from the database
            Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
            Dim dbConn As New OleDbConnection(connString)

            Dim ProductSelectQuery As String = _
                "SELECT [ProductName], [UnitPrice] FROM Products WHERE [ProductID] = ?"
            Dim ProductSelectCommand As New OleDbCommand(ProductSelectQuery, dbConn)

            ProductSelectCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = Convert.ToInt32(ItemID)

            Dim dbReader As OleDbDataReader

            Try
                ' read the product from the database and fill
                ' the prodName and prodPrice variables
                Dim prodName As String = ""
                Dim prodPrice As Double

                dbConn.Open()
                dbReader = ProductSelectCommand.ExecuteReader()
                While dbReader.Read
                    prodName = dbReader.Item("ProductName").ToString()
                    prodPrice = Convert.ToDouble(dbReader.Item("UnitPrice"))
                End While
                dbConn.Close()

                ' If the product does not already exist in the cart, add it
                If Not IsItemInCart(ItemID) Then
                    Dim cartRow As DataRow = Cart.NewRow()
                    cartRow("ID") = CInt(ItemID)
                    cartRow("Product") = prodName
                    cartRow("Price") = prodPrice
                    cartRow("Quantity") = 1
                    cartRow("ItemTotal") = prodPrice
                    Cart.Rows.Add(cartRow)
                    ' Otherwise, find the product and increase its quantity
                Else
                    Dim productIndex As Integer = ItemIndex(ItemID)
                    Cart.Rows(productIndex).Item("Quantity") += 1
                    Cart.Rows(productIndex).Item("ItemTotal") = Cart.Rows(productIndex).Item("Price") * _
                        Cart.Rows(productIndex).Item("Quantity")
                End If

                HttpContext.Current.Session("TotalPrice") = Double.Parse(HttpContext.Current.Session("TotalPrice")) _
                   + prodPrice
                ' Format the price as currency
                HttpContext.Current.Session("ShowPrice") = System.String.Format("{0:C}", HttpContext.Current.Session("TotalPrice"))
                HttpContext.Current.Session("ShoppingCart") = Cart
            Catch ex As Exception
                'Error in add - return false
                Return False
            End Try
            Return True
        Else
            Return False
        End If
    End Function

    ' UpdateQuantity() -- Update the quantity of an item in the cart
    ' This function updates the quantity of an item that already exists in the cart
    ' Parameters: ItemID as string - the item to look for
    '             Quantity as Integer - the new quantity
    ' Returns: True if successful
    '          False if not (product doesnt exist, item id inappropriate, quantity < 1)
    ' Side-Effects: Cart is updated. Session variables updated
    Public Function UpdateQuantity(ByVal ItemID As String, ByVal Quantity As Integer) As Boolean
        If Not IsNumeric(ItemID) Then
            Return False
        End If
        Dim num As Integer = ItemIndex(ItemID)
        ' make sure the item exists, and the quantity is greater than 0
        If num >= 0 And Quantity > 0 Then
            'update cart table with new item Quantity, and recalculate ItemTotal
            Dim oldPrice As Double = Cart.Rows(num).Item("ItemTotal")
            Cart.Rows(num).Item("Quantity") = Quantity
            Cart.Rows(num).Item("ItemTotal") = Cart.Rows(num).Item("Price") * Quantity
            Dim newPrice As Double = Cart.Rows(num).Item("ItemTotal")

            'update session variables
            HttpContext.Current.Session("TotalPrice") = (Double.Parse(HttpContext.Current.Session("TotalPrice")) _
                - oldPrice) + newPrice
            HttpContext.Current.Session("ShowPrice") = System.String.Format("{0:C}", HttpContext.Current.Session("TotalPrice"))
            HttpContext.Current.Session("ShoppingCart") = Cart

            Return True
        Else
            Return False
        End If
    End Function

    ' ItemIndex() -- Finds the index (row) of an item if it is in Cart
    ' Parameters: ItemID as a String
    ' Returns: The item index,
    '       or -1 if the item is not in the table or if the
    '       supplied ItemID is not numeric
    Public Function ItemIndex(ByVal ItemID As String) As Integer
        ' Make sure we don't get an error if the cart has not
        ' been created or the ItemID is not numeric!
        If Cart Is Nothing Or Not IsNumeric(ItemID) Then
            Return -1
        Else
            Dim i As Integer
            For i = 0 To Cart.Rows.Count - 1
                If Cart.Rows(i).Item("ID") = CInt(ItemID) Then
                    Return i
                End If
            Next i
            Return -1
        End If
    End Function

    ' IsItemInCart() -- Checks if an Item is in the Cart
    ' This is simply a convenience function because you can use
    ' the ItemIndex function to see if an item is in the table.
    ' Parameters: ItemID as a String
    ' Returns: True or False
    Public Function IsItemInCart(ByVal ItemID As String) As Boolean
        If ItemIndex(ItemID) >= 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    ' IsCartEmpty() -- Checks if the Cart is empty
    ' This code simply checks the number of rows in the table,
    ' but it is protected from errors because it first checks
    ' that the cart actually exists!
    ' Parameters: None
    ' Returns: True or False
    Public Function IsCartEmpty() As Boolean
        If Cart Is Nothing Then
            Return True
        End If
        If Cart.Rows.Count > 0 Then
            Return False
        Else
            Return True
        End If
    End Function

    ' RemoveFromCart() -- Remove a specified product from the Cart
    ' Parameters: ItemID as a String
    ' Returns: True if successful or False if the item code
    ' is not in the table or the parameter was not numeric.
    ' Side-Effects: Cart is updated.
    Public Function RemoveFromCart(ByVal ItemID As String) As Boolean
        If Not IsNumeric(ItemID) Then
            Return False
        End If
        Dim num As Integer = ItemIndex(ItemID)
        If num >= 0 Then
            'This removes the selected Item (there will only ever be one item with a matching ID
            'as AddToCart increases only the quantity if ItemID already exists
            Dim Price As String = Cart.Rows(num).Item("ItemTotal")
            Cart.Rows.Remove(Cart.Rows(num))
            ' Update the Total Price Session Variable
            HttpContext.Current.Session("TotalPrice") = Double.Parse(HttpContext.Current.Session("TotalPrice")) _
               - Double.Parse(Price)
            ' Format the price as currency
            HttpContext.Current.Session("ShowPrice") = System.String.Format("{0:C}", HttpContext.Current.Session("TotalPrice"))
            HttpContext.Current.Session("ShoppingCart") = Cart
            Return True
        Else
            Return False
        End If
    End Function

    ' EmptyCart() -- Empty the Shopping Cart
    ' Parameters: No parameters.
    ' Returns: Nothing.
    ' Side-Effects: Cart is updated.
    ' NOTE: The garbage collector takes care of the old Cart.
    Public Sub EmptyCart()
        ' Wipe out the cart
        If Not Cart Is Nothing Then
            Cart = Nothing
        End If
        ' Make a new one
        CreateCart()
    End Sub

    ' GetDataTable() -- Return the Cart as a DataTable
    ' This function is used to display the shopping cart
    ' by using the Cart Table as a DataSource
    ' Parameters: None
    ' Returns: Cart as DataTable
    Public Function GetDataTable() As DataTable
        ' Make sure cart exists
        If Not Cart Is Nothing Then
            Return Cart
        Else
            ' If cart doesn't exist, return an empty table
            Dim emptyTable As New DataTable()
            Return emptyTable
        End If
    End Function

    ' GetCount() -- Get the total number of row in Cart
    ' This code simply return the number of row in Cart
    ' Parameters: None
    ' Returns: True or False
    Public Function GetCount() As Integer
        If Cart Is Nothing Then
            Return 0
        End If
        Dim count As Integer = 0
        Dim i As Integer
        For i = 0 To Cart.Rows.Count - 1
            ' If Current row has more than one item quantity
            ' add quantity to total count
            If Cart.Rows(i).Item("Quantity") > 1 Then
                count += Cart.Rows(i).Item("Quantity")
            Else
                count += 1
            End If
        Next
        Return count
    End Function
End Class