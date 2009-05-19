Imports System.Data.OleDb

Partial Class Admin_AdminCatalogue_editparts
    Inherits System.Web.UI.Page

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
        ProductInsertCommand.Parameters.Add("CategoryID", OleDbType.Numeric).Value = ddlAddPartType.SelectedValue
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
            Response.Redirect("editparts.aspx")
        End If
    End Sub

    Protected Sub CancelAddButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelAddButton.Click
        Response.Redirect("editparts.aspx")
    End Sub

    Protected Sub ddlPartType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPartType.DataBound
        ddlPartsProduct.DataBind()
    End Sub

    Protected Sub ddlPartsProduct_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPartsProduct.DataBound
        EditPartDetailsFormView.DataBind()
        EditStockDetailsView.DataBind()
    End Sub

    Protected Sub AdjustStockButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdjustStockButton.Click
        AdjustStockDiv.Visible = True
        AdjustPriceDiv.Visible = False
    End Sub

    Protected Sub AdjustPriceButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdjustPriceButton.Click
        AdjustStockDiv.Visible = False
        AdjustPriceDiv.Visible = True
    End Sub

    Protected Sub DiscontinueProductButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DiscontinueProductButton.Click
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        Dim dbConn As New OleDbConnection(connString)

        Dim DiscontinueUpdateQuery As String = _
            "UPDATE Products SET [Discontinued] = true WHERE [ProductID] = ?"
        Dim DiscontinueUpdateCommand As New OleDbCommand(DiscontinueUpdateQuery, dbConn)

        DiscontinueUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlPartsProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = DiscontinueUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
        Catch ex As Exception

        End Try
        ddlPartsProduct.DataBind()
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
        StockUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlPartsProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = StockUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
            'indicate success
        Catch dbex As OleDbException
            'error handling code
        End Try

        ddlPartsProduct.DataBind()
        AdjustStockDiv.Visible = False
    End Sub

    Protected Sub CancelStockUpdateLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelStockUpdateLinkButton.Click
        AdjustStockDiv.Visible = False
    End Sub

    Protected Sub CancelPriceUpdateLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelPriceUpdateLinkButton.Click
        AdjustPriceDiv.Visible = False
    End Sub

    Private Sub HideAllDivs()
        SelectPartDiv.Visible = False
        AddPartDiv.Visible = False
        EditPartsDetailsDiv.Visible = False
        EditStockDiv.Visible = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim taskID As Integer = Convert.ToInt32(Request.QueryString("TaskID"))
            HideAllDivs()
            Select Case taskID
                Case 1
                    AddPartDiv.Visible = True
                Case 2
                    SelectPartDiv.Visible = True
                    EditPartsDetailsDiv.Visible = True
                Case 3
                    SelectPartDiv.Visible = True
                    EditPartsDetailsDiv.Visible = True
                    EditPartDetailsFormView.ChangeMode(FormViewMode.ReadOnly)
                Case 4
                    SelectPartDiv.Visible = True
                    EditStockDiv.Visible = True
            End Select
        End If
        lblAddUploadError.Visible = False
    End Sub

    Protected Sub EditPartDetailsFormView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles EditPartDetailsFormView.ItemDeleted
        ddlPartType.DataBind()
    End Sub

    Protected Sub EditPartDetailsFormView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles EditPartDetailsFormView.ItemUpdated
        ddlPartType.DataBind()
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
        PriceUpdateCommand.Parameters.Add("ProductID", OleDbType.Numeric).Value = ddlPartsProduct.SelectedValue

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = PriceUpdateCommand.ExecuteNonQuery()
            dbConn.Close()
            'indicate success
        Catch dbex As OleDbException
            'error handling code
        End Try

        ddlPartsProduct.DataBind()
        AdjustPriceDiv.Visible = False
    End Sub
End Class
