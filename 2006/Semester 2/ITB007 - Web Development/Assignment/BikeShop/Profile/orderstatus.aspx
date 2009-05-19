<%@ Page AutoEventWireup="false" CodeFile="orderstatus.aspx.vb" Inherits="orderstatus"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="The Bike Shop &gt; Profile &gt; Order Status" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-blue04 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Current Orders</div>
        <div class="contentbox-noshading">
            <p>
                Below is a list of all your current orders</p>
        </div>
    </div>
    <asp:Label ID="ErrorLabel" runat="server" ForeColor="red"></asp:Label>
    <div class="contentbox-container-full">
        <asp:Repeater ID="OrdersRepeater" runat="server">
            <HeaderTemplate>
                <table class="tabledata">
                <tr>
                    <td>
                        <b>Order Number:</b></td>
                    <td>
                        <b>Order Date:</b></td>
                    <td>
                        <b>Status:</b></td>
                    <td>
                        <b>Estimated Ship Date:</b></td>
                </tr>
                <tr><td colspan="4" class="bg-green03">&nbsp</td></tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="OrderIDLabel" runat="server" Text='<%#Eval("OrderID") %>'></asp:Label></td>
                    <td>
                        <asp:Label ID="OrderDateLabel" runat="server" Text='<%#Eval("OrderDate") %>'></asp:Label></td>
                    <td>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%#Eval("StatusName") %>'></asp:Label></td>
                    <td>
                        <asp:Label ID="ShipDateLabel" runat="server" Text='<%#Eval("ShipDate") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <b>Products Ordered: </b><asp:Label ID="Label1" runat="server" Text='<%#Eval("Products") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:HyperLink ID="ViewOrderHyperLink" runat="server" NavigateUrl='<%#Eval("OrderID", "~/orderReceipt.aspx?OrderID={0}") %>'
                            Target="_blank">View Order Receipt</asp:HyperLink></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table></FooterTemplate>
                <SeparatorTemplate><tr><td colspan="4" class="bg-green03">&nbsp</td></tr></SeparatorTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
