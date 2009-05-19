<%@ Page AutoEventWireup="false" CodeFile="AdminLogin.aspx.vb" Inherits="Default2"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="Admin Pages Login" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <asp:Label ID="WelcomeMsg" runat="server" Text="WelcomeMsg"></asp:Label><br />
    <div id="LoginDiv" runat="server" class="sidebarbox-border bg-grey02" style="left: 4px;
        width: 390px; position: relative; top: 20px; height: 155px">
        <div class="sidebarbox-title-shading bg-grey05 txt-white">
            Login</div>
        <asp:TextBox ID="AdminUsername" runat="server" Style="z-index: 100; left: 13px; position: absolute;
            top: 50px" Width="94px"></asp:TextBox>
        <asp:TextBox ID="AdminPassword" runat="server" Style="z-index: 101; left: 13px; position: absolute;
            top: 94px" TextMode="Password" Width="94px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Style="z-index: 102; left: 13px; position: absolute;
            top: 34px" Text="User Name:" Width="64px"></asp:Label>
        <asp:Label ID="Label2" runat="server" Style="z-index: 103; left: 13px; position: absolute;
            top: 76px" Text="Password:" Width="64px"></asp:Label>
        <asp:Button ID="LoginBtn" runat="server" Style="z-index: 105; left: 13px; position: absolute;
            top: 127px" Text="Login" />
    </div>
    <br />
    <asp:Button ID="LogoutBtn" runat="server" Text="Logout" /><br />
    <br />
    <asp:DetailsView ID="AdminLoginDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="AdminLoginDetails" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
        </Fields>
    </asp:DetailsView>
    &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:AccessDataSource ID="AdminLoginDetails" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
        SelectCommand="SELECT [Username] FROM AdminUsers WHERE (([Username] = ?) AND ([Password] = ?))">
        <SelectParameters>
            <asp:ControlParameter ControlID="AdminUsername" Name="Username" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="AdminPassword" Name="Password" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>
