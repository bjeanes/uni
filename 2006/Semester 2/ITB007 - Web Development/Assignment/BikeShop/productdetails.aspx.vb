Imports System.Data.OleDb

Partial Class productdetails
    Inherits System.Web.UI.Page

    Dim sCart As New ShoppingCart()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sCart.GetCart()
        If Not Page.IsPostBack And Page.Request("ProdID") = 0 Then
            Page.Response.Redirect("~/catalogue.aspx")
        End If
    End Sub

    Protected Sub MainProductDetailsView_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewCommandEventArgs) Handles MainProductDetailsView.ItemCommand
        If e.CommandName = "AddToCart" Then
            'Label1.Text = "There are " & sCart.GetCount() & " items in the Shopping Cart with a total cost of " & _
            'HttpContext.Current.Session("ShowPrice")
            Dim prodID As String = e.CommandArgument.ToString()
            Dim result As Boolean = sCart.AddToCart(prodID)
            If result Then
                Label1.Text = "There are " & sCart.GetCount() & " items in the Shopping Cart with a total cost of " & _
                    HttpContext.Current.Session("ShowPrice")
            End If
        End If
    End Sub
End Class
