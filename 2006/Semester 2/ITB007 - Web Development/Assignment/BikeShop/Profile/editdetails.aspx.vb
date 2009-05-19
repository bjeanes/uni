Imports System.Data.OleDb
Imports System.Data

Partial Class editdetails
    Inherits System.Web.UI.Page
    Dim newPassword As String = ""
    ' declare page variables
    Private customerAdapter As OleDbDataAdapter
    Private customerDetailsAdapter As OleDbDataAdapter
    Private customerDataset As New DataSet()
    Private customerID As Integer
    Private customerDetailsID As Integer
    Private currentPassword As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoginUsername") = "" Then
            Session("LoginRedirect") = Request.ServerVariables("SCRIPT_NAME")
            Response.Redirect("~\Login.aspx")
        Else
            Dim TaskID As Integer = Request.QueryString("TaskID")
            If Not Page.IsPostBack() Then
                DisplayCustomerDetails()
                HideAllDivs()
                Select Case TaskID
                    Case 1
                        EditDetailsDiv.Visible = True
                    Case 2
                        ChangePasswordDiv.Visible = True
                End Select
            Else
                FillCustomerDataset()
            End If
        End If
    End Sub

    Protected Sub FillCustomerDataset()
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
        Dim dbConn As New OleDbConnection(connString)
        Dim SelectCustomerQuery As String = "SELECT * FROM Customers INNER JOIN Details ON Customers.[DetailsID] = Details.[DetailsID] WHERE Customers.[Username] = ?"

        customerAdapter = New OleDbDataAdapter(SelectCustomerQuery, dbConn)
        customerAdapter.SelectCommand.Parameters.Add("Username", OleDbType.VarChar).Value = Session("LoginUsername")

        'fill the dataset
        customerAdapter.Fill(customerDataset)

        Dim customerTable As DataTable = customerDataset.Tables(0)
        customerID = Convert.ToInt32(customerTable.Rows(0).Item("CustomerID"))
        customerDetailsID = Convert.ToInt32(customerTable.Rows(0).Item("Customers.DetailsID"))
        currentPassword = customerTable.Rows(0).Item("Password").ToString()
    End Sub

    Protected Sub DisplayCustomerDetails()
        FillCustomerDataset()
        Dim customerTable As DataTable = customerDataset.Tables(0)
        UsernameLabel.Text = customerTable.Rows(0).Item("UserName").ToString()
        txtboxFirstName.Text = customerTable.Rows(0).Item("GivenName").ToString()
        txtboxLastName.Text = customerTable.Rows(0).Item("FamilyName").ToString()
        txtboxAddress.Text = customerTable.Rows(0).Item("Address").ToString()
        txtboxCity.Text = customerTable.Rows(0).Item("City").ToString()
        txtboxState.Text = customerTable.Rows(0).Item("State").ToString()
        txtboxCountry.Text = customerTable.Rows(0).Item("Country").ToString()
        txtboxPostCode.Text = customerTable.Rows(0).Item("PostalCode").ToString()
        txtboxPhoneNumber.Text = customerTable.Rows(0).Item("PhoneNumber").ToString()
        txtboxEmail.Text = customerTable.Rows(0).Item("EmailAddress").ToString()
    End Sub

    Protected Sub WriteCustomerDetails()
        If customerDataset.Tables.Count > 0 Then
            If Not (customerID = 0 Or customerDetailsID = 0) Then
                Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

                Dim dbConn As New OleDbConnection(connString)

                Dim UpdateCustomersQuery As String = "UPDATE Customers SET [GivenName] = ?, [FamilyName] = ? WHERE [CustomerID] = ?"
                Dim UpdateCustomersCommand As New OleDbCommand(UpdateCustomersQuery, dbConn)
                UpdateCustomersCommand.Parameters.Add("GivenName", OleDbType.VarChar).Value = txtboxFirstName.Text
                UpdateCustomersCommand.Parameters.Add("FamilyName", OleDbType.VarChar).Value = txtboxLastName.Text
                UpdateCustomersCommand.Parameters.Add("CustomerID", OleDbType.Numeric).Value = customerID

                Dim UpdateCustomerDetailsQuery As String = "UPDATE Details SET [Address] = ?, [City] = ?, [State] = ?, [Country] = ?, [PostalCode] = ?, [PhoneNumber] = ?, [EmailAddress] = ? WHERE [DetailsID] = ?"
                Dim UpdateCustomerDetailsCommand As New OleDbCommand(UpdateCustomerDetailsQuery, dbConn)
                UpdateCustomerDetailsCommand.Parameters.Add("Address", OleDbType.VarChar).Value = txtboxAddress.Text
                UpdateCustomerDetailsCommand.Parameters.Add("City", OleDbType.VarChar).Value = txtboxCity.Text
                UpdateCustomerDetailsCommand.Parameters.Add("State", OleDbType.VarChar).Value = txtboxState.Text
                UpdateCustomerDetailsCommand.Parameters.Add("Country", OleDbType.VarChar).Value = txtboxCountry.Text
                UpdateCustomerDetailsCommand.Parameters.Add("PostalCode", OleDbType.VarChar).Value = txtboxPostCode.Text
                UpdateCustomerDetailsCommand.Parameters.Add("PhoneNumber", OleDbType.VarChar).Value = txtboxPhoneNumber.Text
                UpdateCustomerDetailsCommand.Parameters.Add("EmailAddress", OleDbType.VarChar).Value = txtboxEmail.Text
                UpdateCustomerDetailsCommand.Parameters.Add("DetailsID", OleDbType.Numeric).Value = customerDetailsID

                Dim numCustomerRowsUpdated As Integer
                Dim numDetailsRowsUpdated As Integer
                'try to insert into database
                Try
                    dbConn.Open()
                    numCustomerRowsUpdated = UpdateCustomersCommand.ExecuteNonQuery()
                    numDetailsRowsUpdated = UpdateCustomerDetailsCommand.ExecuteNonQuery()
                    dbConn.Close()
                Catch ex As Exception
                Finally
                    If dbConn.State <> ConnectionState.Closed Then
                        dbConn.Close()
                    End If
                End Try
                If numCustomerRowsUpdated = 1 And numDetailsRowsUpdated Then
                    Response.Redirect("editdetails.aspx")
                End If
            End If
        End If
    End Sub

    Protected Sub UpdateDetailsLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateDetailsLinkButton.Click
        WriteCustomerDetails()
    End Sub

    Protected Sub ChangePassword()
        If customerDataset.Tables.Count > 0 Then
            If Not (customerID = 0 Or customerDetailsID = 0 Or currentPassword = "") Then
                Dim newPassword As String = txtboxNewPassword.Text
                Dim confirmPassword As String = txtboxConfirmNewPassword.Text
                Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
                Dim dbConn As New OleDbConnection(connString)

                Dim UpdatePasswordQuery As String = "UPDATE Customers SET [Password] = ? WHERE [CustomerID] = ?"
                Dim UpdatePasswordCommand As New OleDbCommand(UpdatePasswordQuery, dbConn)
                UpdatePasswordCommand.Parameters.Add("Password", OleDbType.VarChar).Value = newPassword
                UpdatePasswordCommand.Parameters.Add("CustomerID", OleDbType.VarChar).Value = customerID
                Dim numberRowsUpdated As Integer
                Try
                    dbConn.Open()
                    numberRowsUpdated = UpdatePasswordCommand.ExecuteNonQuery()
                    dbConn.Close()
                Catch ex As Exception
                Finally
                    If dbConn.State <> ConnectionState.Closed Then
                        dbConn.Close()
                    End If
                End Try
                If numberRowsUpdated = 1 Then
                    'indicate success
                    Response.Redirect("editdetails.aspx")
                Else
                    'indicate failure
                    Response.Redirect("editdetails.aspx")
                End If
            End If
        End If
    End Sub

    Protected Sub btnChangePasswordSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangePasswordSubmit.Click
        If txtboxNewPassword.Text <> txtboxConfirmNewPassword.Text And (txtboxNewPassword.Text = "" Or txtboxConfirmNewPassword.Text = "") Then
            'error
            Exit Sub
        ElseIf txtboxCurrentPassword.Text <> currentPassword Or txtboxCurrentPassword.Text = "" Then
            'error
            Exit Sub
        Else
            ChangePassword()
        End If
    End Sub

    Private Sub HideAllDivs()
        EditDetailsDiv.Visible = False
        ChangePasswordDiv.Visible = False
    End Sub
End Class
