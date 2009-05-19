
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        WelcomeMsg.ForeColor = Drawing.Color.Black
        Dim cookieLogin As String = GetLoginCookie("BikeShopRememberMe")
        If Session("LoginUsername") = "" Then
            If cookieLogin <> "" Then
                Session("LoginUsername") = cookieLogin
                Dim redirectPage As String = Session("LoginRedirect")
                If redirectPage <> "" Then
                    Session("LoginRedirect") = ""
                    Response.Redirect(redirectPage)
                Else
                    Response.Redirect("Default.aspx")
                End If
            End If
        End If
        If Session("LoginUsername") <> "" Then
            WelcomeMsg.Text = "You are already logged in!"
            LoginDiv.Visible = False
            LogoutBtn.Visible = True
        Else
            WelcomeMsg.Text = "Please log in. If you do not have an account, " & _
                    "then please <a href='register.aspx'>register</a>."
            LoginDiv.Visible = True
            LogoutBtn.Visible = False
        End If
    End Sub

    Protected Sub LoginBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginBtn.Click
        UserLoginDetailsView.DataBind()
        If UserLoginDetailsView.Rows.Count = 1 Then
            Session("LoginUsername") = Username.Text
            If RememberMeCheckBox.Checked Then
                SetLoginCookie("BikeShopRememberMe", Username.Text, 14)
            End If
            Dim redirectPage = Session("LoginRedirect")
            If redirectPage <> "" Then
                Session("LoginRedirect") = ""
                Response.Redirect(redirectPage)
            Else
                Response.Redirect("Default.aspx")
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
        Session("LoginUsername") = ""
        Session("LoginRedirect") = ""
        Dim loginCookie As String = GetLoginCookie("BikeShopRememberMe")
        If loginCookie <> "" Then
            SetLoginCookie("BikeShopRememberMe", "", 0)
        End If
        Response.Redirect("Default.aspx")
    End Sub

    Private Function SetLoginCookie(ByVal cookiename As String, ByVal cookievalue As String, ByVal daysToExpire As Integer) As Boolean
        Try
            Dim newCookie As New HttpCookie(cookiename)
            Response.Cookies.Clear()
            Response.Cookies.Add(newCookie)
            newCookie.Values.Add(cookiename, cookievalue)
            Dim expiry As Date = Date.Now.AddDays(daysToExpire)
            Response.Cookies(cookiename).Expires = expiry
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Private Function GetLoginCookie(ByVal cookiename As String) As String
        Dim cookieValue As String
        Try
            cookieValue = Page.Request.Cookies(cookiename).Values(cookiename)
        Catch ex As Exception
            cookieValue = ""
        End Try
        Return cookieValue
    End Function
End Class
