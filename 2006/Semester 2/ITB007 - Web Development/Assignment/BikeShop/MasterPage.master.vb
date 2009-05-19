Imports System.Data
Imports System.Data.OleDb

Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Dim sCart As New ShoppingCart

    Protected Sub trvDefaultNav_TreeNodeDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.TreeNodeEventArgs) Handles trvDefaultNav.TreeNodeDataBound

        ' should eventually remove Admin link if user is not logged in and has Admin role.
        Dim text As String = e.Node.Text

        If Text = "Admin" Then
            e.Node.Parent.ChildNodes.Remove(e.Node)
        End If

        If LCase(Request.Url.PathAndQuery) = LCase(e.Node.NavigateUrl) Then
            e.Node.ExpandAll()
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sCart.GetCart()
        Dim currentURL As String = Page.Request.RawUrl
        currentURL = currentURL.ToLower()
        Dim cataloguePage As Boolean = (currentURL.Contains("catalogue") Or _
            currentURL.Contains("productdetails") Or currentURL.Contains("productlisting") Or currentURL.Contains("searchresults"))

        If cataloguePage Then
            SearchBoxDiv.Visible = True
        Else
            SearchBoxDiv.Visible = False
        End If

        Dim cookieLogin As String = GetLoginCookie("BikeShopRememberMe")
        Dim userLoggedIn As Boolean = False
        If Session("LoginUsername") = "" Then
            If cookieLogin <> "" Then
                Session("LoginUsername") = cookieLogin
                userLoggedIn = True
            Else
                userLoggedIn = False
            End If
        Else
            userLoggedIn = True
        End If
        If userLoggedIn Then
            LogoutDiv.Visible = True
            LoginDiv.Visible = False
            LoginTextLabel.Text = "Welcome " & Session("LoginUsername")
        Else
            LoginDiv.Visible = True
            LogoutDiv.Visible = False
            LoginTextLabel.Text = "Login"
        End If

        If currentURL.Contains("admin") Then
            UserLoginDiv.Visible = False
        End If
    End Sub

    Private Sub DisplayCart()
        If sCart.IsCartEmpty() Then
            EmptyCart.Visible = True
            NonEmptyCart.Visible = False
        Else
            EmptyCart.Visible = False
            NonEmptyCart.Visible = True
            CartItemsLabel.Text = sCart.GetCount()
            CartTotalLabel.Text = HttpContext.Current.Session("ShowPrice")
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        DisplayCart()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If txtboxSearch.Text <> "" Then
            Dim searchString As String = txtboxSearch.Text
            searchString = searchString.Replace(" ", "+")
            Response.Redirect("~/searchresults.aspx?Search=" & searchString)
        End If
    End Sub

    Protected Sub LogoutButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LogoutButton.Click
        Session("LoginUsername") = ""
        Session("LoginRedirect") = ""
        Dim loginCookie As String = GetLoginCookie("BikeShopRememberMe")
        If loginCookie <> "" Then
            SetLoginCookie("BikeShopRememberMe", "", 0)
        End If
        Response.Redirect("~/")
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
