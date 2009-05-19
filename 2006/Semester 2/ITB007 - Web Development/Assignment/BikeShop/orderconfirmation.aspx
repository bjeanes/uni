<%@ Page AutoEventWireup="false" CodeFile="orderconfirmation.aspx.vb" Inherits="orderconfirmation"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="The Bike Shop" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-green07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Success!</div>
        <div class="contentbox-noshading">
            <p>
                Congratulations, your order has been successfully processed! Please print out a
                copy of your Order Receipt by clicking
                <asp:HyperLink ID="OrderReceiptHyperLink" runat="server" Target="_blank" Text="here"></asp:HyperLink></p>
        </div>
    </div>
</asp:Content>
