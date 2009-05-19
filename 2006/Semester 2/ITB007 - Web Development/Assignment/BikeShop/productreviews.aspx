<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="productreviews.aspx.vb" Inherits="productreviews" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">

<div class="contentbox-container-full">
			  <div class="contentbox-title-shading bg-yellow07 box-on">&nbsp;</div>
				<div class="contentbox-title-shading">Product Reviews</div>
        <div class="contentbox-noshading">
          <p>Here are the reviews for (insert product name).</p>
          <br />
        </div>
      </div>
    <asp:Repeater ID="ReviewsRepeater" runat="server" DataSourceID="ReviewsDataSource">
            <ItemTemplate>
                <div class="contentbox-container-full">
                    <div class="contentbox-title-shading bg-blue07 box-on">
                        &nbsp;</div>
                    <div class="contentbox-title-shading">
                        <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("Author") %>'>
                        </asp:Label>&nbsp;-
                           <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>'>
                            </asp:Label>
                        <asp:Label ID="RatingLabel" runat="server" Text='<%# Bind("Rating") %>'>
                        </asp:Label>
                    </div>
                </div>
                <div class="contentbox-container-left">
                    <div class="contentbox-noshading">
                        <p><asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>'>
                            </asp:Label><br />                     
                        </p>
                    </div>
                </div>
                
            </ItemTemplate>
        </asp:Repeater>
    
    &nbsp;<asp:AccessDataSource ID="ReviewsDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT Reviews.Rating, Reviews.ReviewID, Reviews.Content, Reviews.Author, Reviews.[Date] FROM (Reviews INNER JOIN Products ON Reviews.ProductID = Products.ProductID) WHERE (Reviews.ProductID = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="ProdID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>

</asp:Content>

