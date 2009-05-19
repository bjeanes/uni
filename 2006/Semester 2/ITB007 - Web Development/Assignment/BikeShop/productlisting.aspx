<%@ Page AutoEventWireup="false" CodeFile="productlisting.aspx.vb" Inherits="productlisting"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="Product Listing" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div id="ProductListingDiv" runat="server" class="contentbox-container-full">
        <asp:Label ID="Label1" runat="server"></asp:Label><br />
    <br />
        <asp:Repeater ID="ProductListRepeater" runat="server" DataSourceID="ProductListingDataSource">
            <ItemTemplate>
                <div class="contentbox-container-full">
                    <div class="contentbox-title-shading bg-blue07 box-on">
                        &nbsp;</div>
                    <div class="contentbox-title-shading">
                        <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>'>
                        </asp:Label>
                    </div>
                </div>
                <div class="contentbox-container-left">
                    <div class="contentbox-noshading">
                        <p>
                            <b>Description: </b>
                            <asp:Label ID="ProducDescriptionLabel" runat="server" Text='<%# Bind("ProductDescription") %>'>
                            </asp:Label><br />
                            <b>Price:</b>
                            <asp:Label ID="UnitCostLabel" runat="server" Text='<%# Bind("UnitPrice", "${0}") %>'>
                            </asp:Label><br />
                            <b>Quantity Available: </b>
                            <asp:Label ID="UnitsInStockLabel" runat="server" Text='<%# Eval("UnitsInStock") %>'>
                            </asp:Label><br />
                            <asp:HyperLink ID="ProductDetailsHyperlink" runat="server" NavigateUrl='<%# Eval("ProductID", "~/productdetails.aspx?ProdID={0}") %>'
                                Text="View Product">
                            </asp:HyperLink><br />
                            <asp:LinkButton ID="AddToCartLinkButton" runat="server" CommandName="AddToCart" CommandArgument='<%# Bind("ProductID") %>' Text="Add To Cart"></asp:LinkButton><br />
                            <asp:HyperLink ID="ReviewsHyperLink" runat="server" NavigateUrl='<%# Eval("ProductID", "~/productreviews.aspx?ProdID={0}") %>'
                                Text="Reviews">
                            </asp:HyperLink><br />
                        </p>
                    </div>
                </div>
                <div class="contentbox-container-right" style="max-width: 200px">
                    <div class="contentbox-noshading">
                        <a href='<%#Eval("ProductID", "productdetails.aspx?ProdID={0}") %>'>
                            <asp:Image ID="BikePicImage" runat="server" AlternateText="" ImageAlign="right" ImageUrl='<%# Bind("ProductPicUrl") %>'
                                Width="205px" />
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:AccessDataSource ID="ProductListingDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
        SelectCommand="SELECT * FROM [Products] WHERE ([CategoryID] = ? AND [Discontinued] = false)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="CategoryID" QueryStringField="CatID"
                Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>
