<%@ Page AutoEventWireup="false" CodeFile="editnews.aspx.vb" Inherits="Admin_editnews"
    Language="VB" MasterPageFile="~/Admin/MasterPage.master" Title="Untitled Page" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-red07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            News Admin Page</div>
        <br />
    </div>
    <div id="SelectTaskDiv" runat="server" class="contentbox-container-left">
        Please select a task:<br />
        <asp:HyperLink ID="AddNewsHyperLink" runat="server" NavigateUrl="~/Admin/editnews.aspx?TaskID=1">Add News Item</asp:HyperLink><br />
        <asp:HyperLink ID="DeleteNewsHyperLink" runat="server" NavigateUrl="~/Admin/editnews.aspx?TaskID=2">Delete News Item</asp:HyperLink></div>
    <div id="SelectNewsDiv" runat="server" class="contentbox-container-right">
        Search for Article:<br />
        <asp:TextBox ID="txtboxNewsSearch" runat="server"></asp:TextBox><br />
        Search by:
        <br />
        <asp:RadioButton ID="radioAuthor" runat="server" Checked="True" GroupName="SearchOption"
            Text="Author" /><br />
        <asp:RadioButton ID="radioTitle" runat="server" GroupName="SearchOption" Text="Title" /><br />
        <asp:RadioButton ID="radioContent" runat="server" GroupName="SearchOption" Text="Content" /><br />
        <asp:Button ID="btnSearchGo" runat="server" Text="Go!" /></div>
    <div id="AddNewsDiv" runat="server" class="contentbox-container-full">
        <div class="contentbox-title-shading bg-red07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Add news item</div>
        <br />
        <p>
            Title:
            <asp:TextBox ID="txtboxAddNewsTitle" runat="server" Width="279px"></asp:TextBox></p>
        <p>
            Enter article here:
            <br />
            <asp:TextBox ID="txtboxAddNewsContent" runat="server" Height="239px" TextMode="MultiLine"
                Width="407px"></asp:TextBox></p>
        <p>
            Author:
            <asp:TextBox ID="txtboxAddNewsAuthor" runat="server"></asp:TextBox></p>
        <p>
            Image:
            <asp:FileUpload ID="uploadAddNewsPicture" runat="server" Width="242px" /></p>
        <asp:Label ID="lblAddUploadError" runat="server" ForeColor="Red" Text="Error uploading file - Please try again"
            Visible="False"></asp:Label><br />
        <asp:LinkButton ID="AddNewsItemLinkButton" runat="server" CommandName="Add">Add Article</asp:LinkButton>
        <asp:LinkButton ID="CancelAddLinkButton" runat="server" CausesValidation="False"
            CommandName="Cancel">Cancel</asp:LinkButton>
    </div>
    <div id="DeleteNewsDiv" runat="server" class="contentbox-container-full">
        <div class="contentbox-title-shading bg-red07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Delete news item</div>
        <br />
        <asp:Repeater ID="DeleteNewsRepeater" runat="server">
            <ItemTemplate>
                <p>
                    <b>Title:</b>
                    <asp:Label ID="lblNewsTitle" runat="server" Text='<%#Eval("Title") %>'></asp:Label></p>
                <p>
                    <asp:Label ID="lblNewsContent" runat="server" Text='<%#Eval("Content") %>'></asp:Label></p>
                <p>
                    <b>Author:</b>
                    <asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("Author") %>'></asp:Label></p>
                <asp:LinkButton ID="DeleteNewsLinkButton" runat="server" CommandArgument='<%#Eval("NewsID") %>'
                    CommandName="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>
            <SeparatorTemplate>
                <br />
                <br />
            </SeparatorTemplate>
            <FooterTemplate><br /><asp:HyperLink id="CancelHyperlink" runat="server" NavigateUrl="~/Admin/editnews.aspx" Text="Cancel"></asp:HyperLink></FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
