<%@ Page AutoEventWireup="false" CodeFile="useraccounts.aspx.vb" Inherits="Admin_useraccounts"
    Language="VB" MasterPageFile="MasterPage.master" Title="Customer Records" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-red07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            User Accounts Admin Page</div>
        <br />
    </div>
    <div id="SearchUserDiv" runat="server" class="contentbox-container-left">
        Search for User:<br />
        <asp:TextBox ID="txtboxUserSearch" runat="server"></asp:TextBox><br />
        Search by:
        <br />
        <asp:RadioButton ID="radioUsername" runat="server" Checked="True" GroupName="SearchOption"
            Text="Username" /><br />
        <asp:RadioButton ID="radioName" runat="server" GroupName="SearchOption" Text="Name" /><br />
        <asp:Button ID="btnSearchGo" runat="server" Text="Go!" /></div>
    <div class="contentbox-container-full">
        <asp:Repeater ID="UsersRepeater" runat="server">
            <ItemTemplate>
                <div class="contentbox-container-left">
                    <p>
                        <b>User:</b>
                        <asp:Label ID="UsernameLabel" runat="server" Text='<%#Eval("UserName") %>'></asp:Label></p>
                    <table>
                        <tr>
                            <td class="bg-blue03">
                                First Name</td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%#Eval("GivenName") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="bg-blue03">
                                Last Name:</td>
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%#Eval("FamilyName") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="bg-blue03">
                                Registration Date:</td>
                            <td>
                                <asp:Label ID="RegistrationDateLabel" runat="server" Text='<%#Eval("RegistrationDate") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="bg-blue03">
                                Banned:</td>
                            <td>
                                <asp:CheckBox ID="BannedCheckBox" runat="server" Checked='<%#Eval("Banned") %>' Enabled="false" /></td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="BanStatusLinkButton" runat="server" CommandArgument='<%#Eval("CustomerID") %>'
                        CommandName="ChangeBanStatus" Text="Ban / Unban User"></asp:LinkButton>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <br />
                <br />
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
