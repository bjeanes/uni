
Partial Class Admin_MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub trvDefaultNav_TreeNodeDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.TreeNodeEventArgs) Handles trvDefaultNav.TreeNodeDataBound
        If LCase(Request.Url.PathAndQuery) = LCase(e.Node.NavigateUrl) Then
            e.Node.ExpandAll()
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("AdminLoginUsername") = "" Then
            Session("AdminLoginRedirect") = Request.ServerVariables("SCRIPT_NAME")
            Response.Redirect("~/AdminLogin.aspx")
        End If
    End Sub

    Protected Sub LogoutButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LogoutButton.Click
        Session("AdminLoginUsername") = ""
        Session("AdminLoginRedirect") = ""
        Response.Redirect("~/")
    End Sub
End Class

