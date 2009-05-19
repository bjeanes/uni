<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="productdetails.aspx.vb" Inherits="productdetails" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">
    <div id="MainDisplayDiv" runat="server" class="contentbox-container-full">
        <asp:Label ID="Label1" runat="server"></asp:Label><br />
        <asp:DetailsView ID="MainProductDetailsView" runat="server" AutoGenerateRows="False"
            DataSourceID="ProductDetailsDataSource" Height="50px" Width="125px">
            <HeaderTemplate>
                <div class="contentbox-container-full">
                    <div class="contentbox-title-shading bg-blue07 box-on">
                        &nbsp;</div>
                    <div class="contentbox-title-shading">
                        <asp:Label ID="ManufacturerNameLabel" runat="server" Text='<%# Bind("ManufacturerName") %>'>
                        </asp:Label>
                        -
                        <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>'>
                        </asp:Label>
                    </div>
                    <div class="contentbox-title-shading align-right">
                        <asp:Label ID="UnitPriceLabel" runat="server" CssClass="align-right" Text='<%# Bind("UnitPrice", "${0}") %>'>
                        </asp:Label>
                    </div>
                    <div class="contentbox-container-left">
                        <div class="contentbox-noshading">
                                <asp:Image ID="BikePicDisplay" runat="server" AlternateText="Picture Unavailable"
                                    ImageUrl='<%# Bind("ProductPicURL") %>' Width="205px"/>
                        </div>
                    </div>
                    <div class="contentbox-container-right">
                        <div class="contentbox-shading align-centre">
                            <asp:LinkButton ID="AddToCartLinkButton" runat="server" CommandArgument='<%# Bind("ProductID") %>'
                                CommandName="AddToCart" Text="Add To Cart"></asp:LinkButton><br />
                            <asp:HyperLink ID="ReviewsHyperLink" runat="server" NavigateUrl='<%# Eval("ProductID", "~/productreviews.aspx?ProdID={0}") %>'
                                Text="Reviews">
                            </asp:HyperLink><br />
                            <asp:HyperLink ID="ReturnToListLink" runat="server" NavigateUrl='<%# Bind("CategoryID", "~/productlisting.aspx?CatID={0}") %>'
                                Text="Return to Product List">
                            </asp:HyperLink>

                        </div>
                    </div>
                </div>
            </HeaderTemplate>
            <Fields>
                <asp:BoundField DataField="ManufacturerProductCode" HeaderText="Product Code" SortExpression="ManufacturerProductCode">
                    <HeaderStyle CssClass="bg-green03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName">
                    <HeaderStyle CssClass="bg-green03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductDescription" HeaderText="Description" SortExpression="ProductDescription">
                    <HeaderStyle CssClass="bg-green03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitsInStock" HeaderText="Number In Stock" SortExpression="UnitsInStock">
                    <HeaderStyle CssClass="bg-green03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitPrice" DataFormatString="${0}" HeaderText="Price"
                    SortExpression="UnitPrice">
                    <HeaderStyle CssClass="bg-green03" Width="30%" />
                </asp:BoundField>
            </Fields>
        </asp:DetailsView>
        <asp:AccessDataSource ID="ProductDetailsDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT * FROM (Manufacturers INNER JOIN Products ON Manufacturers.ManufacturerID = Products.ManufacturerID) WHERE ProductID = ?">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="ProdID" />
            </SelectParameters>
        </asp:AccessDataSource>    
    </div>
    <div id="ProductSpecsDiv" runat="server" class="contentbox-container-full">
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="SpecsID"
            DataSourceID="ProductSpecsDataSource" Height="50px" Width="100%">
            <HeaderTemplate>
                <div class="content-pagetitle"><b>BIKE SPECS</b></div>
            </HeaderTemplate>
            <Fields>
                <asp:BoundField DataField="YearMade" HeaderText="Year Made" SortExpression="YearMade">
                    <HeaderStyle CssClass="bg-blue03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="Frame" HeaderText="Frame" SortExpression="Frame">
                    <HeaderStyle CssClass="bg-blue03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="Forks" HeaderText="Forks" SortExpression="Forks">
                    <HeaderStyle CssClass="bg-blue03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="Brakes" HeaderText="Brakes" SortExpression="Brakes">
                    <HeaderStyle CssClass="bg-blue03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="Cranks" HeaderText="Cranks" SortExpression="Cranks">
                    <HeaderStyle CssClass="bg-blue03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="Pedals" HeaderText="Pedals" SortExpression="Pedals">
                    <HeaderStyle CssClass="bg-blue03" Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="RearShock" HeaderText="Rear Shock" SortExpression="RearShock">
                    <HeaderStyle CssClass="bg-blue03" Width="30%" />
                </asp:BoundField>
            </Fields>
        </asp:DetailsView>
        <asp:AccessDataSource ID="ProductSpecsDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT * FROM ProductSpecs WHERE SpecsID IN (SELECT ProductDescriptionID FROM Products WHERE ProductID = ?)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="ProdID" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
</asp:Content>