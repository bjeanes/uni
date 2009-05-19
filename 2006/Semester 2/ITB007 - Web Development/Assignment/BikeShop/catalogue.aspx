<%@ Page AutoEventWireup="false" CodeFile="catalogue.aspx.vb" Inherits="catalogue"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="The Bike Shop &gt; Catalogue" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="content-pagetitle">
        <p>
            CATALOGUE -- Select a category</p>
    </div>
    <br />
    <br />
    <br />
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-blue07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            <a href="catalogue/bikes.aspx">Bikes</a></div>
        <div class="contentbox-noshading">
            <p>
                Our huge selection of quality bikes at affordable prices means we take the effort
                out of buying. The Bike Shop stocks a wide variety of brands from many of the top
                manufacturers.</p>
            <asp:Image ID="Image1" runat="server" Height="82px" ImageUrl="~/img/bike2.jpg" Style="left: 236px;
                position: relative; top: -12px" Width="137px" /></div>
    </div>
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-green07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            <a href="catalogue/parts.aspx">Parts</a></div>
        <div class="contentbox-noshading">
            <p>
                We have a huge range of parts. Our catalogue categories are Forks, Frames, Wheels
                and Handle Bars.</p>
            <asp:Image ID="Image2" runat="server" Height="91px" ImageUrl="~/img/tire.jpg" Style="left: 243px;
                position: relative; top: -9px" Width="87px" />
        </div>
    </div>
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-red07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            <a href="catalogue/accessories.aspx">Accessories</a></div>
        <div class="contentbox-noshading">
            <p>
                Our accessories section provides a wide selection of clothing, protective gear and
                miscellaneous items, such as camel backs.</p>
            <asp:Image ID="Image3" runat="server" Height="87px" ImageUrl="~/img/jersey.jpg" Style="left: 248px;
                position: relative; top: 11px" Width="147px" />
        </div>
    </div>
</asp:Content>
