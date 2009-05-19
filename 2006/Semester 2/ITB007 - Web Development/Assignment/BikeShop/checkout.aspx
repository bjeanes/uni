<%@ Page AutoEventWireup="false" CodeFile="checkout.aspx.vb" Inherits="checkout"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="The Bike Shop" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
<div id="ErrorDiv" runat="server" class="contentbox-container-full" visible="false"><asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label></div>
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-yellow07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Checkout</div>
        <div class="contentbox-noshading">
            <p>
                Please complete the steps below to purchase the items in your shopping cart</p>
        </div>
    </div>
    <div id="Step1Div" runat="server" class="contentbox-container-full">
        <div class="contentbox-title-shading">
            Step 1 - Shipping Method</div>
        <div class="contentbox-noshading">
            <p>
                Please select a shipping method (select Pick-Up option to pick up from a local store):</p>
            <asp:RadioButton ID="PickupRadioButton" runat="server" Checked="true" GroupName="ShippingMethod"
                Text="Pick Up" /><br />
            <asp:RadioButton ID="ShippingRadioButton" runat="server" Checked="false" GroupName="ShippingMethod"
                Text="Ship" />
            <asp:DropDownList ID="ddlShippingMethod" runat="server" DataSourceID="ShippingMethodDataSource"
                DataTextField="MethodNameDisplay" DataValueField="MethodID">
            </asp:DropDownList><asp:AccessDataSource ID="ShippingMethodDataSource" runat="server"
                DataFile="~/App_Data/BikeShopDB.mdb" SelectCommand='SELECT MethodID, MethodName & ", $" & MethodPrice as MethodNameDisplay FROM ShippingMethods'>
            </asp:AccessDataSource>
            <br />
            <asp:LinkButton ID="Step1ContinueLinkButton" runat="server" Text="Continue"></asp:LinkButton>
            <asp:HyperLink ID="ReturnToCartHyperlink" runat="server" NavigateUrl="~/shoppingcart.aspx"
                Text="Return To Cart"></asp:HyperLink>
        </div>
    </div>
    <div id="Step2Div" runat="server" class="contentbox-container-full" visible="false">
        <div class="contentbox-title-shading">
            Step 2 - Payment Method</div>
        <div class="contentbox-noshading">
            <p>
                Please select the method you would like to use as payment:</p>
            <asp:RadioButton ID="CashRadioButton" runat="server" Checked="true" GroupName="PaymentMethod"
                Text="Cash (COD for Shipped orders)" /><br />
            <asp:RadioButton ID="CreditCardRadioButton" runat="server" Enabled="false" GroupName="PaymentMethod"
                Text="Credit Card (Online Payment)" /><asp:Label ID="NotSupportedLabel" runat="server"
                    ForeColor="Red" Text="The Bike Shop does not currently support online credit card payments - sorry for any inconvenience"></asp:Label><br />
            <asp:LinkButton ID="Step2ContinueLinkButton" runat="server" Text="Continue"></asp:LinkButton>
            <asp:LinkButton ID="Step2CancelLinkButton" runat="server" Text="Back"></asp:LinkButton></div>
    </div>
    <div id="Step3Div" runat="server" class="contentbox-container-full" visible="false">
        <div class="contentbox-title-shading">
            Step 3 - Confirm and Checkout</div>
        <div class="contentbox-noshading">
            <table>
                <tr>
                    <td colspan="2">
                        <b>Products:</b></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="ProductListGridView" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Sub Total:</b></td>
                    <td align="right">
                        <asp:Label ID="ProductSubTotalLabel" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <td colspan="2">
                        <b>Shipping:</b></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ShippingMethodLabel" runat="server"></asp:Label></td>
                    <td align="right">
                        <asp:Label ID="ShippingCostLabel" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <b>Sub Total:</b></td>
                    <td align="right">
                        <asp:Label ID="ShippingSubTotalLabel" runat="server"></asp:Label></td>
                </tr>
            </table>
            <br />
            <p><b>Payment Method:</b> <asp:Label ID="PaymentMethodLabel" runat="server"></asp:Label></p>
            <p>
                <b>Order Summary:</b><br />
                <asp:Label ID="OrderTotalsLabel" runat="server"></asp:Label></p>
            
                <asp:LinkButton ID="ConfirmLinkButton" runat="server" Text="Confirm and Check out"></asp:LinkButton>
                <asp:LinkButton ID="Step3BackLinkButton" runat="server" Text="Back"></asp:LinkButton>
                <asp:LinkButton ID="CancelOrderLinkButton" runat="server" Text="Cancel Order"></asp:LinkButton>
        </div>
    </div>
</asp:Content>
