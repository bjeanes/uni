<%@ Page AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Default2" Language="VB"
    MasterPageFile="~/MasterPage.master" Title="Login Page" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <asp:Label ID="WelcomeMsg" runat="server" Text="WelcomeMsg"></asp:Label><br />
    <div id="LoginDiv" runat="server" class="sidebarbox-border bg-grey02" style="left: 4px;
        width: 390px; position: relative; top: 20px; height: 171px">
        <div class="sidebarbox-title-shading bg-grey05 txt-white">
            Login</div>
        <asp:TextBox ID="Username" runat="server" Style="z-index: 100; left: 13px; position: absolute;
            top: 50px" Width="94px"></asp:TextBox>
        <asp:TextBox ID="Password" runat="server" Style="z-index: 101; left: 13px; position: absolute;
            top: 94px" TextMode="Password" Width="94px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Style="z-index: 102; left: 13px; position: absolute;
            top: 34px" Text="User Name:" Width="64px"></asp:Label>
        <asp:Label ID="Label2" runat="server" Style="z-index: 103; left: 13px; position: absolute;
            top: 76px" Text="Password:" Width="64px"></asp:Label>
        <asp:Button ID="LoginBtn" runat="server" Style="z-index: 105; left: 29px; position: absolute;
            top: 148px" Text="Login" EnableTheming="True" />
        <br />
        <asp:CheckBox ID="RememberMeCheckBox" runat="server" Checked="False" Style="z-index: 106;
            left: 15px; position: absolute; top: 121px" Text="Remember Me" />
    </div>
    <br />
    <asp:Button ID="LogoutBtn" runat="server" Text="Logout" /><br />
    <br />
    <asp:DetailsView ID="UserLoginDetailsView" runat="server" AutoGenerateRows="False"
        DataKeyNames="CustomerID" DataSourceID="UserLoginDetails" Height="50px" Visible="False"
        Width="125px">
        <Fields>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False"
                ReadOnly="True" SortExpression="CustomerID" />
        </Fields>
    </asp:DetailsView>
    &nbsp;
    <asp:AccessDataSource ID="UserLoginDetails" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
        SelectCommand="SELECT [CustomerID] FROM [Customers] WHERE (([UserName] = ?) AND ([Password] = ?) AND ([Banned] = false))">
        <SelectParameters>
            <asp:ControlParameter ControlID="Username" Name="UserName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>
