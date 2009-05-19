Imports System.Data.OleDb
Imports System.Data

Partial Class Admin_editnews
    Inherits System.Web.UI.Page

    Protected Sub AddNewsItemLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddNewsItemLinkButton.Click
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString

        Dim dbConn As New OleDbConnection(connString)

        Dim InsertNewsQuery As String = _
            "INSERT INTO FrontPageNews ([Title], [Content], [PostDate], [Author], [RelatedPicURL]) VALUES(?,?,?,?,?)"
        Dim InsertNewsCommand As New OleDbCommand(InsertNewsQuery, dbConn)

        Dim uploadImagePath As String = ""
        'check if there is a file to upload
        If uploadAddNewsPicture.HasFile Then
            'check if it is an appropriate file
            Dim imageType As String = uploadAddNewsPicture.PostedFile.ContentType.Substring(0, 5)
            If imageType = "image" Then
                Try
                    uploadImagePath = "~/Upload/" & uploadAddNewsPicture.FileName
                    uploadAddNewsPicture.SaveAs(Server.MapPath(uploadImagePath))
                Catch ex As Exception
                    lblAddUploadError.Visible = True
                    Exit Sub
                End Try
            End If
        End If

        Dim newsDate As Date = Date.Now()

        InsertNewsCommand.Parameters.Add("Title", OleDbType.VarChar, 75).Value = txtboxAddNewsTitle.Text
        InsertNewsCommand.Parameters.Add("Content", OleDbType.LongVarChar).Value = txtboxAddNewsContent.Text
        InsertNewsCommand.Parameters.Add("PostDate", OleDbType.Date).Value = newsDate
        InsertNewsCommand.Parameters.Add("Author", OleDbType.VarChar, 60).Value = txtboxAddNewsAuthor.Text
        InsertNewsCommand.Parameters.Add("RelatedPicURL", OleDbType.VarChar, 250).Value = uploadImagePath

        Dim numberRowsInserted As Integer

        Try
            dbConn.Open()
            numberRowsInserted = InsertNewsCommand.ExecuteNonQuery()
            dbConn.Close()
        Catch ex As Exception
        Finally
            If dbConn.State <> ConnectionState.Closed Then
                dbConn.Close()
            End If
        End Try
        Response.Redirect("editnews.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblAddUploadError.Visible = False
        If Not Page.IsPostBack Then
            Dim taskID As Integer = Request.QueryString("TaskID")
            HideAllDivs()
            Select Case taskID
                Case 1
                    HideAllDivs()
                    AddNewsDiv.Visible = True
                Case 2
                    HideAllDivs()
                    SelectNewsDiv.Visible = True
                    DeleteNewsDiv.Visible = True
            End Select
        end if
    End Sub

    Protected Sub CancelAddLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelAddLinkButton.Click
        Response.Redirect("editnews.aspx")
    End Sub

    Protected Sub btnSearchGo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchGo.Click
        SearchNews()
    End Sub

    Protected Sub DeleteNewsRepeater_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles DeleteNewsRepeater.ItemCommand
        If e.CommandName = "Delete" Then
            Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
            Dim dbConn As New OleDbConnection(connString)
            Dim DeleteNewsQuery As String = "DELETE FROM FrontPageNews WHERE [NewsID] = ?"
            Dim DeleteNewsCommand As New OleDbCommand(DeleteNewsQuery, dbConn)
            DeleteNewsCommand.Parameters.Add("NewsID", OleDbType.Numeric).Value = e.CommandArgument
            Try
                dbConn.Open()
                DeleteNewsCommand.ExecuteNonQuery()
                dbConn.Close()
            Catch ex As Exception
            Finally
                If dbConn.State <> ConnectionState.Closed Then
                    dbConn.Close()
                End If
            End Try
            SearchNews()
        End If
    End Sub

    Private Sub HideAllDivs()
        SelectNewsDiv.Visible = False
        DeleteNewsDiv.Visible = False
        AddNewsDiv.Visible = False
    End Sub

    Private Sub SearchNews()
        Dim connString As String = ConfigurationManager.ConnectionStrings("BikeShopDB").ConnectionString
        Dim dbConn As New OleDbConnection(connString)

        Dim SelectNewsSearchField As String = ""

        If radioAuthor.Checked Then
            SelectNewsSearchField = "Author"
        ElseIf radioTitle.Checked Then
            SelectNewsSearchField = "Title"
        Else
            SelectNewsSearchField = "Content"
        End If

        Dim SelectNewsQuery As String = "SELECT * FROM FrontPageNews"
        If SelectNewsSearchField <> "" Then
            SelectNewsQuery += " WHERE [" & SelectNewsSearchField & "] LIKE ?"
        End If

        Dim SearchText As String = "%" & txtboxNewsSearch.Text & "%"

        Dim SearchDataSet As New DataSet()
        Dim SearchAdapter As New OleDbDataAdapter(SelectNewsQuery, dbConn)

        SearchAdapter.SelectCommand.Parameters.Add(SelectNewsSearchField, OleDbType.VarChar).Value = SearchText

        SearchAdapter.Fill(SearchDataSet)

        DeleteNewsRepeater.DataSource = SearchDataSet
        DeleteNewsRepeater.DataBind()
    End Sub
End Class
