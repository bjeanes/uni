<%@ Page AutoEventWireup="false" CodeFile="searchresults.aspx.vb" Inherits="searchresults"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
            DataSourceID="SearchResultsDataSource">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False"
                    ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductDescription" HeaderText="ProductDescription" SortExpression="ProductDescription" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="SearchResultsDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT ProductID, ProductName, ProductDescription FROM Products WHERE ProductID IN (?)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="?" SessionField="SearchResults" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    <div id="ManufacturerSearchResults" runat="server" class="contentbox-container-full">
        <div class="contentbox-title-shading bg-blue07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Results by Manufacturer
            <%  If Not ManufacturerRepeater.DataSource Is Nothing Then
                                            Dim table As Data.DataTable = ManufacturerRepeater.DataSource
                                            Response.Write(" - " & table.Rows.Count & " result(s)")
                                        End If%>
        </div>
        <asp:Repeater ID="ManufacturerRepeater" runat="server">
            <ItemTemplate>
                <div class="contentbox-container-full">
                    <div class="contentbox-title-shading">
                        <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>'>
                        </asp:Label>
                    </div>
                </div>
                <div class="contentbox-container-left">
                    <div class="contentbox-noshading">
                        <p>
                            <b>Manufacturer Name:</b>
                            <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("ManufacturerName") %>'>
                            </asp:Label><br />
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
                            <asp:LinkButton ID="AddToCartLinkButton" runat="server" CommandArgument='<%# Bind("ProductID") %>'
                                CommandName="AddToCart" Text="Add To Cart"></asp:LinkButton><br />
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
    <div id="ProductSearchResults" runat="server" class="contentbox-container-full">
        <div class="contentbox-title-shading bg-blue07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Results by Product Name or Description<%  If Not ProductsRepeater.DataSource Is Nothing Then
                                                            Dim table As Data.DataTable = ProductsRepeater.DataSource
                                                          Response.Write(" - " & table.Rows.Count & " result(s)")
                                                        End If%></div>
        <asp:Repeater ID="ProductsRepeater" runat="server">
            <ItemTemplate>
                <div class="contentbox-container-full">
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
                            <asp:LinkButton ID="AddToCartLinkButton" runat="server" CommandArgument='<%# Bind("ProductID") %>'
                                CommandName="AddToCart" Text="Add To Cart"></asp:LinkButton><br />
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
    <div id="EmptySearchResults" runat="server" class="contentbox-container-full" visible="false">
        <p>
            Your search returned no results, please try again!</p>
    </div>
</asp:Content>
