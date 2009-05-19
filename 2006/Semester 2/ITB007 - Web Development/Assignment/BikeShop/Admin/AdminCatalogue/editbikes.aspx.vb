Imports System.Data.OleDb
Imports System.Data

Partial Class Admin_AdminCatalogue_editbikes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim taskID As Integer = Request.QueryString("TaskID")
            HideAllDivs()
            Select Case taskID
                Case 1
                    AddBikeDiv.Visible = True
                Case 2
                    SelectBikeDiv.Visible = True
                    EditBikeDetailsDiv.Visible = True
                Case 3
                    SelectBikeDiv.Visible = True
                    EditBikeDetailsDiv.Visible = True
                    EditBikeDetailsFormView.ChangeMode(FormViewMode.ReadOnly)
                Case 4
                    SelectBikeDiv.Visible = True
                    EditStockDiv.Visible = True
            End Select
        End If
        lblAddUploadError.Visible = False
        Dim currentUploadPath As String = ""
    End Sub

    Protected Sub AddProductButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddProductButton.Click

        'create connection string
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        'create db connection
        Dim dbConn As New OleDbConnection(connString)

        Dim newProductSpecsID As Integer = 0


        'set up insert product specs
        Dim ProductSpecsInsertQuery As String = _
            "INSERT INTO ProductSpecs ([YearMade], [Frame], [Forks], [Brakes], [Cranks], [Pedals], [RearShock]) VALUES(?,?,?,?,?,?,?)"
        Dim ProductSpecsInsertCommand As New OleDbCommand(ProductSpecsInsertQuery, dbConn)

        ProductSpecsInsertCommand.Parameters.Add("YearMade", OleDbType.VarChar, 5).Value = txtboxAddYearMade.Text
        ProductSpecsInsertCommand.Parameters.Add("Frame", OleDbType.VarChar).Value = txtboxAddFrame.Text
        ProductSpecsInsertCommand.Parameters.Add("Forks", OleDbType.VarChar).Value = txtboxAddForks.Text
        ProductSpecsInsertCommand.Parameters.Add("Brakes", OleDbType.VarChar).Value = txtboxAddBrakes.Text
        ProductSpecsInsertCommand.Parameters.Add("Cranks", OleDbType.VarChar).Value = txtboxAddCranks.Text
        ProductSpecsInsertCommand.Parameters.Add("Pedals", OleDbType.VarChar).Value = txtboxAddPedals.Text
        ProductSpecsInsertCommand.Parameters.Add("RearShock", OleDbType.VarChar).Value = txtboxAddRearShock.Text

        Dim numberRowsInserted As Integer

        Dim uploadImagePath As String = ""
        'check if there is a file to upload
        If uploadAddProductPicURL.HasFile Then
            'check if it is an appropriate file
            Dim imageType As String = uploadAddProductPicURL.PostedFile.ContentType.Substring(0, 5)
            If imageType = "image" Then
                Try
                    uploadImagePath = "~/Upload/" & uploadAddProductPicURL.FileName
                    uploadAddProductPicURL.SaveAs(Server.MapPath(uploadImagePath))
                Catch ex As Exception
                    lblAddUploadError.Visible = True
                    Exit Sub
                End Try
            End If
        End If

        Try
            dbConn.Open()
            numberRowsInserted = ProductSpecsInsertCommand.ExecuteNonQuery()
            dbConn.Close()
        Catch dbex As OleDbException
            Dim dbe As OleDbError
            For Each dbe In dbex.Errors
                Response.Write("<div>" & dbe.ToString() & "</div>")
            Next
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try

        'set up select statement to get new product specs id
        Dim ProductSpecsIDSelectQuery As String = "SELECT max([SpecsID]) FROM ProductSpecs"
        Dim ProductSpecsIDSelectCommand As New OleDbCommand(ProductSpecsIDSelectQuery, dbConn)

        Try
            dbConn.Open()
            newProductSpecsID = ProductSpecsIDSelectCommand.ExecuteScalar()
            dbConn.Close()
        Catch dbex As OleDbException
            Dim dbe As OleDbError
            For Each dbe In dbex.Errors
                Response.Write("<div>" & dbe.ToString() & "</div>")
            Next
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try

        'set up product insertion
        Dim ProductInsertQuery As String = _
            "INSERT INTO Products ([ManufacturerID], [ManufacturerProductCode], [ProductName], [ProductPicURL], [CategoryID], [UnitsInStock], [UnitPrice], [ReorderLevel], [Discontinued], [ProductDescriptionID])" & _
            "VALUES (?,?,?,?,?,?,?,?,?,?)"
        Dim ProductInsertCommand As New OleDbCommand(ProductInsertQuery, dbConn)

        ProductInsertCommand.Parameters.Add("ManufacturerID", OleDbType.Numeric).Value = ddlAddManufacturerID.SelectedValue
        ProductInsertCommand.Parameters.Add("ManufacturerProductCode", OleDbType.VarChar, 15).Value = txtboxAddManufacturerProdCode.Text
        ProductInsertCommand.Parameters.Add("ProductName", OleDbType.VarChar, 30).Value = txtboxAddProductName.Text
        ProductInsertCommand.Parameters.Add("ProductPicURL", OleDbType.VarChar, 250).Value = uploadImagePath
        ProductInsertCommand.Parameters.Add("CategoryID", OleDbType.Numeric).Value = ddlAddBikeCategory.SelectedValue
        ProductInsertCommand.Parameters.Add("UnitsInStock", OleDbType.Numeric).Value = txtboxAddUnitsInStock.Text
        ProductInsertCommand.Parameters.Add("UnitPrice", OleDbType.Currency).Value = txtboxAddUnitPrice.Text
        ProductInsertCommand.Parameters.Add("ReorderLevel", OleDbType.Numeric).Value = txtboxAddReorderLevel.Text
        ProductInsertCommand.Parameters.Add("Discontinued", OleDbType.Boolean).Value = Boolean.FalseString
        ProductInsertCommand.Parameters.Add("ProductDescriptionID", OleDbType.Numeric).Value = newProductSpecsID


        'try to insert product into database
        Try
            dbConn.Open()

            numberRowsInserted = ProductInsertCommand.ExecuteNonQuery()

            dbConn.Close()
        Catch dbex As OleDbException
            Dim dbe As OleDbError
            For Each dbe In dbex.Errors
                Response.Write("<div>" & dbe.ToString() & "</div>")
            Next
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try

        If numberRowsInserted = 1 Then
            Response.Redirect("~/Admin/AdminCatalogue/editbikes.aspx")
        End If

    End Sub

    Private Sub HideAllDivs()
        SelectBikeDiv.Visible = False
        EditBikeDetailsDiv.Visible = False
        AddBikeDiv.Visible = False
        EditStockDiv.Visible = False
    End Sub

    Protected Sub ddlBikeType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBikeType.DataBound
        ddlBikeCat.DataBind()
    End Sub

    Protected Sub ddlBikeCat_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBikeCat.DataBound
        ddlBikeProduct.DataBind()
    End Sub

    Protected Sub ddlBikeProduct_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBikeProduct.DataBound
        EditBikeDetailsFormView.DataBind()
        EditStockDetailsView.DataBind()
    End Sub

    Protected Sub ddlAddBikeType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlAddBikeType.DataBound
        ddlAddBikeCategory.DataBind()
    End Sub

    Protected Sub CancelAddButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelAddButton.Click
        Response.Redirect("editbikes.aspx")
    End Sub

    Protected Sub DiscontinueProductButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DiscontinueProductButton.Click
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        Dim dbConn As New OleDbConnection(connString)

        Dim DiscontinueUpdateQuery As String = _
            "UPDATE Products SET [Discontinued] = true WHERE [ProductID] = ?"
        Dim DiscontinueUpdateCommand As New OleDbCommand(DiscontinueUpdateQuery, dbConn)

        DiscontinueUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlBikeProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = DiscontinueUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
        Catch ex As Exception

        End Try
        ddlBikeProduct.DataBind()
    End Sub

    Protected Sub AdjustStockButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdjustStockButton.Click
        AdjustStockDiv.Visible = True
        AdjustPriceDiv.Visible = False
    End Sub

    Protected Sub AdjustPriceButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdjustPriceButton.Click
        AdjustPriceDiv.Visible = True
        AdjustStockDiv.Visible = False
    End Sub

    Protected Sub UpdateStockLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateStockLinkButton.Click
        'create connection string
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        'create db connection
        Dim dbConn As New OleDbConnection(connString)

        'set up product update
        Dim StockUpdateQuery As String = _
            "UPDATE Products SET [UnitsInStock] = ? WHERE [ProductID] = ?"
        Dim StockUpdateCommand As New OleDbCommand(StockUpdateQuery, dbConn)

        StockUpdateCommand.Parameters.Add("UnitsInStock", OleDbType.Numeric).Value = NewStockTextBox.Text
        StockUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlBikeProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = StockUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
            'indicate success
        Catch dbex As OleDbException
            'error handling code
        End Try

        ddlBikeProduct.DataBind()
        AdjustStockDiv.Visible = False
    End Sub

    Protected Sub CancelStockUpdateLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelStockUpdateLinkButton.Click
        AdjustStockDiv.Visible = False
    End Sub

    Protected Sub UpdatePriceLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdatePriceLinkButton.Click
        'create connection string
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        'create db connection
        Dim dbConn As New OleDbConnection(connString)

        'set up product update
        Dim PriceUpdateQuery As String = _
            "UPDATE Products SET [UnitPrice] = ? WHERE [ProductID] = ?"
        Dim PriceUpdateCommand As New OleDbCommand(PriceUpdateQuery, dbConn)

        PriceUpdateCommand.Parameters.Add("UnitPrice", OleDbType.Numeric).Value = NewPriceTextBox.Text
        PriceUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlBikeProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = PriceUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
            'indicate success
        Catch dbex As OleDbException
            'error handling code
        End Try

        ddlBikeProduct.DataBind()
        AdjustPriceDiv.Visible = False
    End Sub

    Protected Sub CancelPriceUpdateLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelPriceUpdateLinkButton.Click
        AdjustPriceDiv.Visible = False
    End Sub

    Protected Sub EditBikeDetailsFormView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles EditBikeDetailsFormView.ItemDeleted
        Response.Redirect("editbikes.aspx")
    End Sub

    Protected Sub EditBikeDetailsFormView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles EditBikeDetailsFormView.ItemUpdated
        Response.Redirect("editbikes.aspx")
    End Sub
End Class
