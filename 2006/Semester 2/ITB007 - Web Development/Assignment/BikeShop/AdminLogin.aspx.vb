
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        WelcomeMsg.ForeColor = Drawing.Color.Black
        If Session("AdminLoginUsername") <> "" Then
            WelcomeMsg.Text = "You are already logged in!"
            LoginDiv.Visible = False
            LogoutBtn.Visible = True
        Else
            WelcomeMsg.Text = "Please log in. If you do not have an account, then please contact Admin"
            LoginDiv.Visible = True
            LogoutBtn.Visible = False
        End If
    End Sub

    Protected Sub LoginBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginBtn.Click
        AdminLoginDetailsView.DataBind()
        If AdminLoginDetailsView.Rows.Count = 1 Then
            Session("AdminLoginUsername") = AdminUsername.Text
            Dim redirectPage = Session("AdminLoginRedirect")
            If redirectPage <> "" Then
                Session("AdminLoginRedirect") = ""
                Response.Redirect(redirectPage)
            Else
                Response.Redirect("~/Admin/Default.aspx")
            End If
            WelcomeMsg.Text = "You are already logged in!"
            WelcomeMsg.ForeColor = Drawing.Color.Black
            LoginDiv.Visible = False
            LogoutBtn.Visible = True
        Else
            ' If error (user does not exist), error message.
            WelcomeMsg.Text = "Invalid Username/Password. Please try again."
            WelcomeMsg.ForeColor = Drawing.Color.Red
        End If
    End Sub

    Protected Sub LogoutBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LogoutBtn.Click
        Session("AdminLoginUsername") = ""
        Session("AdminLoginRedirect") = ""
        Response.Redirect("Default.aspx")
    End Sub
End Class
