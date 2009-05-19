
Partial Class orderconfirmation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString("OrderID") = "" Then
            OrderReceiptHyperLink.NavigateUrl = "~/orderReceipt.aspx?OrderID=" & Request.QueryString("OrderID")
        Else
            Response.Redirect("~/")
        End If
    End Sub
End Class
