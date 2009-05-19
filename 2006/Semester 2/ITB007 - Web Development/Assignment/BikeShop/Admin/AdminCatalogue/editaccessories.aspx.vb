Imports System.Data.OleDb

Partial Class Admin_AdminCatalogue_editaccessories
    Inherits System.Web.UI.Page

    Protected Sub CancelAddButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelAddButton.Click
        Response.Redirect("editaccessories.aspx")
    End Sub

    Protected Sub ddlAccType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlAccType.DataBound
        If ddlAccType.SelectedValue = "22" Then
            ddlAccCat.DataSourceID = "AccessoryCategoryAltDataSource"
            ddlAccCat.DataBind()
            ddlAccCat.Visible = False
        Else
            ddlAccCat.DataSourceID = "AccessoryCategoryDataSource"
            ddlAccCat.DataBind()
            ddlAccCat.Visible = True
        End If
    End Sub


    Protected Sub ddlAccCat_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlAccCat.DataBound
        ddlAccProduct.DataBind()
    End Sub

    Protected Sub ddlAccType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlAccType.SelectedIndexChanged
        If ddlAccType.SelectedValue = "22" Then
            ddlAccCat.DataSourceID = "AccessoryCategoryAltDataSource"
            ddlAccCat.DataBind()
            ddlAccCat.Visible = False
        Else
            ddlAccCat.DataSourceID = "AccessoryCategoryDataSource"
            ddlAccCat.DataBind()
            ddlAccCat.Visible = True
        End If
    End Sub


    Protected Sub ddlAddAccType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlAddAccType.DataBound
        If ddlAddAccType.SelectedValue = "22" Then
            ddlAddAccCat.DataSourceID = "AccessoryCategoryAltDataSource_Add"
            ddlAddAccCat.DataBind()
            ddlAddAccCat.Visible = False
        Else
            ddlAddAccCat.DataSourceID = "AccessoryCategoryDataSource_Add"
            ddlAddAccCat.DataBind()
            ddlAccCat.Visible = True
        End If
    End Sub

    Protected Sub ddlAddAccType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlAddAccType.SelectedIndexChanged
        If ddlAddAccType.SelectedValue = "22" Then
            ddlAddAccCat.DataSourceID = "AccessoryCategoryAltDataSource_Add"
            ddlAddAccCat.DataBind()
            ddlAddAccCat.Visible = False
        Else
            ddlAddAccCat.DataSourceID = "AccessoryCategoryDataSource_Add"
            ddlAddAccCat.DataBind()
            ddlAccCat.Visible = True
        End If
    End Sub

    Protected Sub ddlAccProduct_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlAccProduct.DataBound
        EditAccessoryDetailsFormView.DataBind()
        EditStockDetailsView.DataBind()
    End Sub

    Protected Sub EditAccessoryDetailsFormView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles EditAccessoryDetailsFormView.ItemDeleted
        ddlAccType.DataBind()
    End Sub

    Protected Sub EditAccessoryDetailsFormView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles EditAccessoryDetailsFormView.ItemUpdated
        ddlAccType.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim taskID As Integer = Convert.ToInt32(Request.QueryString("TaskID"))
            HideAllDivs()
            Select Case taskID
                Case 1
                    AddAccessoryDiv.Visible = True
                Case 2
                    SelectAccessoryDiv.Visible = True
                    EditAccessoryDetailsDiv.Visible = True
                Case 3
                    SelectAccessoryDiv.Visible = True
                    EditAccessoryDetailsDiv.Visible = True
                    EditAccessoryDetailsFormView.ChangeMode(FormViewMode.ReadOnly)
                Case 4
                    SelectAccessoryDiv.Visible = True
                    EditStockDiv.Visible = True
            End Select
        End If
        lblAddUploadError.Visible = False
    End Sub

    Private Sub HideAllDivs()
        SelectAccessoryDiv.Visible = False
        AddAccessoryDiv.Visible = False
        EditAccessoryDetailsDiv.Visible = False
        EditStockDiv.Visible = False
    End Sub

    Protected Sub AddProductButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddProductButton.Click
        'create connection string
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        'create db connection
        Dim dbConn As New OleDbConnection(connString)

        'set up product insertion
        Dim ProductInsertQuery As String = _
            "INSERT INTO Products ([ManufacturerID], [ManufacturerProductCode], [ProductName], [ProductDescription], [ProductPicURL], [CategoryID], [UnitsInStock], [UnitPrice], [ReorderLevel], [Discontinued])" & _
            "VALUES (?,?,?,?,?,?,?,?,?,?)"
        Dim ProductInsertCommand As New OleDbCommand(ProductInsertQuery, dbConn)

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

        ProductInsertCommand.Parameters.Add("ManufacturerID", OleDbType.Numeric).Value = ddlAddManufacturerID.SelectedValue
        ProductInsertCommand.Parameters.Add("ManufacturerProductCode", OleDbType.VarChar, 15).Value = txtboxAddManufacturerProdCode.Text
        ProductInsertCommand.Parameters.Add("ProductName", OleDbType.VarChar, 30).Value = txtboxAddProductName.Text
        ProductInsertCommand.Parameters.Add("ProductDescription", OleDbType.VarChar).Value = txtboxAddProductDescription.Text
        ProductInsertCommand.Parameters.Add("ProductPicURL", OleDbType.VarChar, 250).Value = uploadImagePath
        ProductInsertCommand.Parameters.Add("CategoryID", OleDbType.Numeric).Value = ddlAddAccCat.SelectedValue
        ProductInsertCommand.Parameters.Add("UnitsInStock", OleDbType.Numeric).Value = txtboxAddUnitsInStock.Text
        ProductInsertCommand.Parameters.Add("UnitPrice", OleDbType.Currency).Value = txtboxAddUnitPrice.Text
        ProductInsertCommand.Parameters.Add("ReorderLevel", OleDbType.Numeric).Value = txtboxAddReorderLevel.Text
        ProductInsertCommand.Parameters.Add("Discontinued", OleDbType.Boolean).Value = Boolean.FalseString

        Dim numberRowsInserted As Integer

        'try to insert product into database
        Try
            dbConn.Open()

            numberRowsInserted = ProductInsertCommand.ExecuteNonQuery

            dbConn.Close()

        Catch dbex As OleDbException
            Dim dbe As OleDbError
            Response.Write("<div class='contentbox-container-left bg-red03'>")
            For Each dbe In dbex.Errors
                Response.Write(dbe.ToString)
                Response.Write("<br />")
            Next
            Response.Write("</div>")
        End Try

        If numberRowsInserted = 1 Then
            Response.Redirect("editaccessories.aspx")
        End If
    End Sub

    Protected Sub AdjustStockButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdjustStockButton.Click
        AdjustStockDiv.Visible = True
        AdjustPriceDiv.Visible = False
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
        StockUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlAccProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = StockUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
            'indicate success
        Catch dbex As OleDbException
            'error handling code
        End Try

        ddlAccProduct.DataBind()
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
        PriceUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlAccProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = PriceUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
            'indicate success
        Catch dbex As OleDbException
            'error handling code
        End Try

        ddlAccProduct.DataBind()
        AdjustPriceDiv.Visible = False
    End Sub

    Protected Sub CancelPriceUpdateLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelPriceUpdateLinkButton.Click
        AdjustPriceDiv.Visible = False
    End Sub

    Protected Sub CancelStockUpdateLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelStockUpdateLinkButton.Click
        AdjustStockDiv.Visible = False
    End Sub

    Protected Sub AdjustPriceButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdjustPriceButton.Click
        AdjustPriceDiv.Visible = True
        AdjustStockDiv.Visible = False
    End Sub

    Protected Sub DiscontinueProductButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DiscontinueProductButton.Click
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        Dim dbConn As New OleDbConnection(connString)

        Dim DiscontinueUpdateQuery As String = _
            "UPDATE Products SET [Discontinued] = true WHERE [ProductID] = ?"
        Dim DiscontinueUpdateCommand As New OleDbCommand(DiscontinueUpdateQuery, dbConn)

        DiscontinueUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlAccProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = DiscontinueUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
        Catch ex As Exception

        End Try
        ddlAccProduct.DataBind()
    End Sub
End Class
