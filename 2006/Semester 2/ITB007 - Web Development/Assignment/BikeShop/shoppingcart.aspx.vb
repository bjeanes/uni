Imports System.Data

Partial Class shoppingcartpage
    Inherits System.Web.UI.Page

    Dim sCart As New ShoppingCart

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' initialise the sCart shopping cart
        sCart.GetCart()
        If Not sCart Is Nothing Then
            ' Retrieve cart's contents and display in repeater
            ShoppingCartRepeater.DataSource = sCart.GetDataTable()
            If Not Page.IsPostBack Then
                ' Only databind repeater if not postback
                ShoppingCartRepeater.DataBind()
            End If
        End If
        ' If shopping cart is empty, display EmptyCartDiv
        ' Otherwise display MainDisplayDiv
        If sCart.IsCartEmpty() Then
            MainDisplayDiv.Visible = False
            EmptyCartDiv.Visible = True
        Else

            MainDisplayDiv.Visible = True
            EmptyCartDiv.Visible = False
        End If
        ErrorDiv.Visible = False
    End Sub

    Protected Sub ShoppingCartRepeater_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles ShoppingCartRepeater.ItemCommand
        ' Perform shopping cart actions such as remove item and update quantity
        ' Local variables for this method:
        Dim dataSourceTable As DataTable = ShoppingCartRepeater.DataSource
        Dim currentRowIndex As Integer = e.Item.ItemIndex
        Dim currentRow As DataRow = dataSourceTable.Rows(currentRowIndex)
        Dim currentProductID As String = currentRow.Item("ID")

        Dim quantityTextBox As TextBox = e.Item.FindControl("QuantityTextBox")
        Dim newQuantity As String = quantityTextBox.Text

        ' UpdateQuantity was selected:
        If e.CommandName = "UpdateQuantity" Then
            If IsNumeric(newQuantity) Then
                If newQuantity > 0 Then
                    If Not sCart.UpdateQuantity(currentProductID, newQuantity) Then
                        ErrorDiv.Visible = True
                        ErrorLabel.Text = "Updating quantity errored - please try again"
                    End If
                    ShoppingCartRepeater.DataBind()
                Else
                    ErrorDiv.Visible = True
                    ErrorLabel.Text = "Quantity must be above 0"
                End If
            Else
                ErrorDiv.Visible = True
                ErrorLabel.Text = "Quantity must be numeric"
            End If
        End If
        ' DeleteProduct was selected:
        If e.CommandName = "DeleteProduct" Then
            If Not sCart.RemoveFromCart(currentProductID) Then
                ErrorDiv.Visible = True
                ErrorLabel.Text = "Removing product errored - please try again!"
            End If
            ' If shopping cart is empty, display EmptyCartDiv
            ' Otherwise display MainDisplayDiv
            If sCart.IsCartEmpty() Then
                MainDisplayDiv.Visible = False
                EmptyCartDiv.Visible = True
            Else

                MainDisplayDiv.Visible = True
                EmptyCartDiv.Visible = False
            End If
            ShoppingCartRepeater.DataBind()
        End If
    End Sub
End Class
