Imports System.Data
Imports System.Data.OleDb

Partial Class searchresults
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim manufacturerTable As DataTable = Session("ManufacturerSearchResults")
            Dim productTable As DataTable = Session("ProductSearchResults")
            If Not manufacturerTable Is Nothing Then
                If manufacturerTable.Rows.Count > 0 Then
                    ManufacturerRepeater.DataSource = Session("ManufacturerSearchResults")
                    ManufacturerRepeater.DataBind()
                Else
                    ManufacturerSearchResults.Visible = False
                End If
            Else
                ManufacturerSearchResults.Visible = False
            End If
            If Not productTable Is Nothing Then
                If productTable.Rows.Count > 0 Then
                    ProductsRepeater.DataSource = Session("ProductSearchResults")
                    ProductsRepeater.DataBind()
                Else
                    ProductSearchResults.Visible = False
                End If
            Else
                ProductSearchResults.Visible = False
            End If
            If (Not ProductSearchResults.Visible) And (Not ManufacturerSearchResults.Visible) Then
                EmptySearchResults.Visible = True
            End If
        End If

        Dim searchString As String = Request.QueryString("Search")
        If searchString <> "" And Not Page.IsPostBack Then
            Search()
        End If
    End Sub

    Private Sub Search()
        'retrieve search term and replace spaces
        Dim SearchString As String = Request.QueryString("Search")
        SearchString = SearchString.Replace("+", " ")

        'create database connection
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
        Dim dbConn As New OleDbConnection(connString)

        'set up search query field
        Dim searchQuery As String = "%" & SearchString & "%"

        'set up manufacturer search result
        Dim ManufacturerSearchSelect As String = "SELECT * FROM Products INNER JOIN Manufacturers ON Products.[ManufacturerID] = Manufacturers.[ManufacturerID] WHERE [ManufacturerName] like ?"
        Dim ManufacturerSearchDataAdapter As New OleDbDataAdapter(ManufacturerSearchSelect, dbConn)
        ManufacturerSearchDataAdapter.SelectCommand.Parameters.Add("ManufacturerName", OleDbType.VarChar).Value = searchQuery
        Dim ManufacturerSearchTable As New DataTable()
        ManufacturerSearchDataAdapter.Fill(ManufacturerSearchTable)

        'set up product search results
        Dim ProductSearchSelect As String = "SELECT * FROM Products WHERE [ProductName] like ? OR [ProductDescription] like ?"
        Dim ProductSearchDataAdapter As New OleDbDataAdapter(ProductSearchSelect, dbConn)
        ProductSearchDataAdapter.SelectCommand.Parameters.Add("ProductName", OleDbType.VarChar).Value = searchQuery
        ProductSearchDataAdapter.SelectCommand.Parameters.Add("ProductDescription", OleDbType.LongVarChar).Value = searchQuery
        Dim ProductSearchTable As New DataTable()
        ProductSearchDataAdapter.Fill(ProductSearchTable)

        If ManufacturerSearchTable.Rows.Count > 0 Then
            ManufacturerRepeater.DataSource = ManufacturerSearchTable
            ManufacturerRepeater.DataBind()
            ManufacturerSearchResults.Visible = True
        Else
            ManufacturerSearchResults.Visible = False
        End If
        If ProductSearchTable.Rows.Count > 0 Then
            ProductsRepeater.DataSource = ManufacturerSearchTable
            ProductsRepeater.DataBind()
            ProductSearchResults.Visible = True
        Else
            ProductSearchResults.Visible = False
        End If

        If ProductSearchResults.Visible Or ManufacturerSearchResults.Visible Then
            EmptySearchResults.Visible = False
        Else
            EmptySearchResults.Visible = True
        End If
    End Sub
End Class
