<%@ Page AutoEventWireup="false" CodeFile="history.aspx.vb" Inherits="history" Language="VB"
    MasterPageFile="~/MasterPage.master" Title="The Bike Shop &gt; Profile &gt; History" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <div class="contentbox-container-full">
            <div class="contentbox-title-shading bg-blue07 box-on">
                &nbsp;</div>
            <div class="contentbox-title-shading">
                Order History</div>
        </div>
        <p>
            Find orders made within the last:<br />
            <asp:LinkButton ID="OneMonthLinkButton" runat="server" Text="One month"></asp:LinkButton><br />
            <asp:LinkButton ID="SixMonthLinkButton" runat="server" Text="Six months"></asp:LinkButton><br />
            <asp:LinkButton ID="AllOrdersLinkButton" runat="server" Text="All Orders"></asp:LinkButton></p>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label>
    </div>
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
                    <tr>
                        <td class="bg-green03" colspan="4">
                            &nbsp</td>
                    </tr>
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
                        <b>Products Ordered: </b>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Products") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:HyperLink ID="ViewOrderHyperLink" runat="server" NavigateUrl='<%#Eval("OrderID", "~/orderReceipt.aspx?OrderID={0}") %>'
                            Target="_blank">View Order Receipt</asp:HyperLink></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table></FooterTemplate>
            <SeparatorTemplate>
                <tr>
                    <td class="bg-green03" colspan="4">
                        &nbsp</td>
                </tr>
            </SeparatorTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
