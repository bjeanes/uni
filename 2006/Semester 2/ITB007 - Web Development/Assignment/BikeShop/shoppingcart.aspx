<%@ Page AutoEventWireup="false" CodeFile="shoppingcart.aspx.vb" Inherits="shoppingcartpage"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="The Bike Shop &gt; Shopping Cart" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div id="ErrorDiv" runat="server" class="contentbox-container-full">
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label></div>
    <div id="MainDisplayDiv" runat="server">
        <div class="contentbox-container-full">
            <div class="contentbox-title-shading bg-yellow07 box-on">
                &nbsp;</div>
            <div class="contentbox-title-shading">
                Shopping Cart</div>
            <div class="contentbox-noshading">
                The items currently in your basket are listed below.<br />
                <asp:HyperLink ID="HeaderCheckOutHyperlink" runat="server" NavigateUrl="~/checkout.aspx"
                    Text="Check Out"></asp:HyperLink>
                <asp:HyperLink ID="HeaderGoShoppingHyperlink" runat="server" NavigateUrl="~/catalogue.aspx"
                    Text="Go Shopping"></asp:HyperLink>
            </div>
        </div>
        <div id="CartDisplayDiv" runat="server" class="contentbox-container-full">
            <asp:Repeater ID="ShoppingCartRepeater" runat="server">
                <ItemTemplate>
                    <div class="contentbox-container-full">
                        <div class="contentbox-title-shading bg-blue07 box-on">
                            &nbsp;</div>
                        <div class="contentbox-title-shading">
                            <%#DataBinder.Eval(Container.DataItem, "Product")%>
                        </div>
                        <br />
                        <p>
                            <%#Eval("Price") %>
                            x
                            <asp:TextBox ID="QuantityTextBox" runat="server" Style="width: 20px" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                            = $<%#Eval("ItemTotal")%>
                        </p>
                        <asp:CompareValidator ID="UpdateValidation" runat="server" ControlToValidate="QuantityTextBox"
                            ErrorMessage="Please enter a number greater than 0" Operator="GreaterThan" Type="integer"
                            ValidationGroup="CartValidation" ValueToCompare="0"></asp:CompareValidator><br />
                        <asp:LinkButton ID="DeleteProductLinkButton" runat="server" CausesValidation="False"
                            CommandName="DeleteProduct" Text="Remove From Cart"></asp:LinkButton><br />
                        <asp:LinkButton ID="UpdateQuantityLinkButton" runat="server" CommandName="UpdateQuantity"
                            Text="Update Quantity" ValidationGroup="CartValidation"></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <b>Total =
                <%Response.Write(Session("ShowPrice"))%>
            </b>
            <br />
            <asp:HyperLink ID="FooterCheckOutHyperlink" runat="server" NavigateUrl="~/checkout.aspx"
                Text="Check Out"></asp:HyperLink>
            <asp:HyperLink ID="FooterGoShoppingHyperlink" runat="server" NavigateUrl="~/catalogue.aspx"
                Text="Go Shopping"></asp:HyperLink>
        </div>
    </div>
    <div id="EmptyCartDiv" runat="server" class="contentbox-container-full">
        <div class="contentbox-title-shading bg-yellow07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Shopping Cart</div>
        <div class="contentbox-noshading">
            <p>
                Your cart is currently empty.
                <asp:HyperLink ID="GoShoppingHyperLink" runat="server" NavigateUrl="~/catalogue.aspx"
                    Text="Go Shopping"></asp:HyperLink></p>
        </div>
    </div>
</asp:Content>
