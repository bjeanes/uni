<%@ Page Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="admincatalogue.aspx.vb" Inherits="Admin_admincatalogue" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">
    <div class="content-pagetitle">
        <p>
            ADMIN
            CATALOGUE -- Select a category</p>
    </div>
    <br />
    <br />
    <br />
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-blue07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            <a href="AdminCatalogue/editbikes.aspx">Edit Bikes</a></div>
        <div class="contentbox-noshading">
            <p>
                This section is for adding, editing or deleting Bikes from the website</p>
            <asp:Image ID="Image1" runat="server" Height="82px" ImageUrl="~/img/bike2.jpg" Style="left: 236px;
                position: relative; top: -12px" Width="137px" /></div>
    </div>
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-green07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            <a href="AdminCatalogue/editparts.aspx">Edit Parts</a></div>
        <div class="contentbox-noshading">
            <p>
                This section is for adding, editing or deleting Parts from the website</p>
            <asp:Image ID="Image2" runat="server" Height="91px" ImageUrl="~/img/tire.jpg" Style="left: 243px;
                position: relative; top: -9px" Width="87px" />
        </div>
    </div>
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-red07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            <a href="AdminCatalogue/editaccessories.aspx">Edit Accessories</a></div>
        <div class="contentbox-noshading">
            <p>
                This section is for adding, editing or deleting Accessory products from the website</p>
            <asp:Image ID="Image4" runat="server" Height="87px" ImageUrl="~/img/jersey.jpg" Style="left: 248px;
                position: relative; top: 11px" Width="147px" />
        </div>
    </div>
</asp:Content>

