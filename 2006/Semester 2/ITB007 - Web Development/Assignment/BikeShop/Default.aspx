<%@ Page AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" Language="VB"
    MasterPageFile="~/MasterPage.master" Title="The Bike Shop &gt; Home" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-red07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Welcome</div>
        <div class="contentbox-noshading">
            <p>
                <b>The Bike Shop</b> is currently one of Brisbane’s largest and most successful
                bike stores, offering extensive services in bike sales and maintenance at five stores
                throughout Brisbane. Check out our huge catalogue of quality brands at affordable
                prices.</p>
            <p>
                &nbsp;</p>
            <img alt="" src="./img/bikeshopfront.jpg" style="left: 5px; width: 415px; position: relative;
                top: -8px; height: 280px" />
        </div>
    </div>
    <div class="contentbox-container-full">
        <asp:Repeater ID="NewsRepeater" runat="server" DataSourceID="NewsDataSource">
            <ItemTemplate>
                <div class="contentbox-container-full">
                    <div class="contentbox-title-shading bg-red07 box-on">
                        &nbsp;</div>
                    <div class="contentbox-title-shading">
                        <asp:Label ID="ArticleTitleLabel" runat="server" Text='<%# Eval("Title") %>'>
                        </asp:Label>
                    </div>
                </div>
                <div class="contentbox-container-left contentbox-noshading">
                    <p>
                        <b>Posted - </b>
                        <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("PostDate") %>'>
                        </asp:Label><br />
                        <br />
                        <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>'>
                        </asp:Label><br />
                        <b>Author - </b>
                        <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>'>
                        </asp:Label><br />
                    </p>
                </div>
                <div class="contentbox-container-right contentbox-noshading">
                    <asp:Image ID="Image1" runat="server" AlternateText="" ImageAlign="right" ImageUrl='<%# Eval("RelatedPicUrl") %>'
                        Width="180px" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:AccessDataSource ID="NewsDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT * FROM [FrontPageNews] ORDER BY [PostDate] DESC"></asp:AccessDataSource>
    </div>
</asp:Content>
