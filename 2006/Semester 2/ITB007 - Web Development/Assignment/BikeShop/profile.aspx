<%@ Page AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="profile" Language="VB"
    MasterPageFile="~/MasterPage.master" Title="The Bike Shop &gt; Profile" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-blue07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Profile</div>
        <h1>
            Welcome
            <asp:Label ID="WelcomeLabel" runat="server"></asp:Label></h1>
    </div>
    
    <div class="contentbox-container-full">
    <b>Please select a task:</b><br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profile/editdetails.aspx"
            Text="Edit Profile Details"></asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Profile/orderstatus.aspx"
            Text="View Current Orders"></asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Profile/history.aspx"
            Text="View Order History"></asp:HyperLink></div>
    
    
</asp:Content>
