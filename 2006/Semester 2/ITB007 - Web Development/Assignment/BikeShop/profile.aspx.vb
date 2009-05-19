Imports System.Data.OleDb
Imports System.Data
Partial Class profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LoginUsername") = "" Then
            Session("LoginRedirect") = Request.ServerVariables("SCRIPT_NAME")
            Response.Redirect("~/Login.aspx")
        Else
            WelcomeLabel.Text = Session("LoginUsername")
        End If
    End Sub
End Class
