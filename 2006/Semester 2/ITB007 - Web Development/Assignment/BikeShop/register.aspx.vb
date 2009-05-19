Imports System.Data.OleDb
Imports System.Data

Partial Class register
    Inherits System.Web.UI.Page

    Protected Sub RegisterLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RegisterLinkButton.Click
        If Validation() Then
            RegisterUser()
        End If
    End Sub

    Private Function Validation() As Boolean
        'error situation - return false
        'all i can think of is repeating client side validation

        'check to make sure the username doesnt already exist
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
        Dim dbConn As New OleDbConnection(connString)

        Dim currentUsername As String = UserName.Text

        Dim SelectUserNameQuery As String = "SELECT [UserName] FROM Customers"
        Dim SelectUserNameDataAdapter As New OleDbDataAdapter(SelectUserNameQuery, dbConn)

        Dim usernameTable As New DataTable()
        SelectUserNameDataAdapter.Fill(usernameTable)

        'check current username against each existing username
        For Each usernameRow As DataRow In usernameTable.Rows
            If currentUsername = usernameRow.Item("UserName").ToString() Then
                'error if username match is found
                ErrorLabel.Text = "Username is already taken - please select another!" & "<br />"
                Return False
            End If
        Next
        Return True
    End Function

    Private Sub RegisterUser()
        'set up db connection string
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        'set up db connection
        Dim dbConn As New OleDbConnection(connString)

        'set up Details insertion
        Dim CustomerDetailsInsertQuery As String = _
            "INSERT INTO Details ([Address], [City], [State], [Country], [PostalCode], [PhoneNumber], [EmailAddress])" & _
            "VALUES (?,?,?,?,?,?,?)"
        Dim CustomerDetailsInsertCommand As New OleDbCommand(CustomerDetailsInsertQuery, dbConn)

        'add parameters
        CustomerDetailsInsertCommand.Parameters.Add("Address", OleDbType.VarChar, 50).Value = Address.Text
        CustomerDetailsInsertCommand.Parameters.Add("City", OleDbType.VarChar, 50).Value = City.Text
        CustomerDetailsInsertCommand.Parameters.Add("State", OleDbType.VarChar, 25).Value = State.Text
        CustomerDetailsInsertCommand.Parameters.Add("Country", OleDbType.VarChar, 30).Value = Country.Text
        CustomerDetailsInsertCommand.Parameters.Add("PostalCode", OleDbType.VarChar, 4).Value = PostCode.Text
        CustomerDetailsInsertCommand.Parameters.Add("PhoneNumber", OleDbType.VarChar, 11).Value = PhoneNumber.Text
        CustomerDetailsInsertCommand.Parameters.Add("EmailAddres", OleDbType.VarChar, 50).Value = Email.Text

        Dim newDetailsID As Integer = 0

        'try to insert customer details
        Try
            dbConn.Open()
            newDetailsID = CustomerDetailsInsertCommand.ExecuteScalar()
            dbConn.Close()
        Catch dbex As OleDbException
            Dim dbe As OleDbError
            Response.Write("<div>First Insert</div>")
            For Each dbe In dbex.Errors
                Response.Write("<div>" & dbe.ToString() & "</div>")
            Next
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try

        'set up details select statement
        Dim CustomerDetailsIDSelectQuery As String = "SELECT max([DetailsID]) FROM Details"
        Dim CustomerDetailsIDSelectCommand As New OleDbCommand(CustomerDetailsIDSelectQuery, dbConn)

        Try
            dbConn.Open()
            newDetailsID = CustomerDetailsIDSelectCommand.ExecuteScalar()
            dbConn.Close()
        Catch ex As Exception
        Finally
            If dbConn.State <> ConnectionState.Open Then
                dbConn.Close()
            End If
        End Try

        'set up Customer Account Insert
        Dim CustomerInsertQuery As String = _
            "INSERT INTO Customers ([UserName], [Password], [GivenName], [FamilyName], [RegistrationDate], [DetailsID])" & _
            "VALUES (?,?,?,?,?,?)"
        Dim CustomerInsertCommand As New OleDbCommand(CustomerInsertQuery, dbConn)

        CustomerInsertCommand.Parameters.Add("UserName", OleDbType.VarChar, 20).Value = UserName.Text
        CustomerInsertCommand.Parameters.Add("Password", OleDbType.VarChar, 64).Value = Password.Text
        CustomerInsertCommand.Parameters.Add("GivenName", OleDbType.VarChar, 30).Value = FirstName.Text
        CustomerInsertCommand.Parameters.Add("Surname", OleDbType.VarChar, 30).Value = LastName.Text
        CustomerInsertCommand.Parameters.Add("RegistrationDate", OleDbType.Date).Value = System.DateTime.Now
        CustomerInsertCommand.Parameters.Add("DetailsID", OleDbType.Numeric).Value = newDetailsID

        Dim numRowsInserted As Integer
        'try to insert customer into database
        Try
            dbConn.Open()
            numRowsInserted = CustomerInsertCommand.ExecuteNonQuery()
            dbConn.Close()
        Catch dbex As OleDbException
            Dim dbe As OleDbError
            Response.Write("<div>Second Insert</div>")
            For Each dbe In dbex.Errors
                Response.Write("<div>" & dbe.ToString() & "</div>")
            Next
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try
        If numRowsInserted = 1 Then
            Session("LoginUsername") = UserName.Text
            If Session("LoginRedirect") <> "" Then
                Dim loginRedirect As String = Session("LoginRedirect")
                Session("LoginRedirect") = ""
                Response.Redirect(loginRedirect)
            Else
                Response.Redirect("~/profile.aspx")
            End If
        End If
    End Sub
End Class
