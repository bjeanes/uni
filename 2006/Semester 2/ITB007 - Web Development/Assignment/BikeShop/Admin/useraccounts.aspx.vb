Imports System.Data
Imports System.Data.OleDb

Partial Class Admin_useraccounts
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UsersRepeater.DataSource = SearchUsers()
    End Sub

    Protected Sub btnSearchGo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchGo.Click
        UsersRepeater.DataBind()
    End Sub

    Private Function SearchUsers() As DataSet
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
        Dim dbConn As New OleDbConnection(connString)

        Dim SelectSearchField1 As String = ""
        Dim SelectSearchField2 As String = ""
        Dim nameFields As Boolean = False

        If radioUsername.Checked Then
            SelectSearchField1 = "UserName"
        Else
            SelectSearchField1 = "GivenName"
            SelectSearchField2 = "FamilyName"
            nameFields = True
        End If
        Dim SearchText As String
        Dim SelectUsersQuery As String = "SELECT * FROM Customers"
        If txtboxUserSearch.Text <> "" Then
            If Not nameFields Then
                If SelectSearchField1 <> "" Then
                    SelectUsersQuery += " WHERE [" & SelectSearchField1 & "] LIKE ?"
                End If
            Else
                If SelectSearchField1 <> "" And SelectSearchField2 <> "" Then
                    SelectUsersQuery += " WHERE [" & SelectSearchField1 & "] LIKE ? OR [" & SelectSearchField2 & "] LIKE ?"
                End If
            End If

            SearchText = "%" & txtboxUserSearch.Text & "%"
        End If

        Dim SearchDataSet As New DataSet()
        Dim SearchAdapter As New OleDbDataAdapter(SelectUsersQuery, dbConn)

        If txtboxUserSearch.Text <> "" Then
            If Not nameFields Then
                SearchAdapter.SelectCommand.Parameters.Add(SelectSearchField1, OleDbType.VarChar).Value = SearchText
            Else
                SearchAdapter.SelectCommand.Parameters.Add(SelectSearchField1, OleDbType.VarChar).Value = SearchText
                SearchAdapter.SelectCommand.Parameters.Add(SelectSearchField2, OleDbType.VarChar).Value = SearchText
            End If
        End If

        SearchAdapter.Fill(SearchDataSet)

        Return SearchDataSet
    End Function

    Protected Sub UsersRepeater_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles UsersRepeater.ItemCommand
        If e.CommandName = "ChangeBanStatus" Then
            Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
            Dim dbConn As New OleDbConnection(connString)

            Dim repeaterSource As Repeater = source
            Dim repeaterDataSource As DataSet = repeaterSource.DataSource
            Dim itemIndex As Integer = e.Item.ItemIndex
            Dim bannedStatus As Boolean = repeaterDataSource.Tables(0).Rows(itemIndex).Item("Banned")

            Dim newBannedStatus As Boolean = Not bannedStatus

            Dim UpdateBanQuery As String = "UPDATE Customers SET [Banned] = ? WHERE [CustomerID] = ?"
            Dim UpdateBanCommand As New OleDbCommand(UpdateBanQuery, dbConn)
            UpdateBanCommand.Parameters.Add("Banned", OleDbType.Boolean).Value = newBannedStatus
            UpdateBanCommand.Parameters.Add("CustomerID", OleDbType.Numeric).Value = Convert.ToInt32(e.CommandArgument)

            Dim numRowsUpdated As Integer
            Try
                dbConn.Open()
                numRowsUpdated = UpdateBanCommand.ExecuteNonQuery()
                dbConn.Close()
            Catch ex As Exception
            Finally
                If dbConn.State <> ConnectionState.Closed Then
                    dbConn.Close()
                End If
            End Try
            If numRowsUpdated = 1 Then
                Response.Redirect("useraccounts.aspx")
            End If
        End If
    End Sub
End Class
