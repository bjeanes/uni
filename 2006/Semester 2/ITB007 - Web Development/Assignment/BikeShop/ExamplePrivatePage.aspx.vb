
Partial Class ExamplePrivatePage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoginUsername") = "" Then
            Session("LoginRedirect") = Request.ServerVariables("SCRIPT_NAME")
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class
