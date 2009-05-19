<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="road.aspx.vb" Inherits="road" title="The Bike Shop &gt; Catalogue &gt; Road Bikes"%>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">
<div class="content-pagetitle"><p>BIKES -- Select a category</p></div>
    <br />
    <br />
    <br />
			
			<div class="contentbox-container-left">
			  <div class="contentbox-title-shading bg-red07 box-on">&nbsp;</div>
			  <div class="contentbox-title-shading"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/productlisting.aspx?CatID=13">Entry Level Road Bikes</asp:HyperLink></div>
                
        <div class="contentbox-noshading">
            <asp:HyperLink runat="server" NavigateUrl="~/productlisting.aspx?CatID=13"><asp:Image ID="Image3" runat="server" style="left: 5px; position: relative; top: -3px" Height="117px" ImageUrl="~/img/bike1.jpg" Width="190px" /></asp:HyperLink></div>
      </div>
      
<div class="contentbox-container-right">
			  <div class="contentbox-title-shading bg-green07 box-on">&nbsp;</div>
			  <div class="contentbox-title-shading"><asp:HyperLink runat="server" NavigateUrl="~/productlisting.aspx?CatID=14">Mid Range Road Bikes</asp:HyperLink></div>
        <div class="contentbox-noshading">
            <asp:HyperLink runat="server" NavigateUrl="~/productlisting.aspx?CatID=14"><asp:Image ID="Image2" runat="server" style="left: 5px; position: relative; top: -3px" Height="117px" ImageUrl="~/img/bike2.jpg" Width="190px" /></asp:HyperLink></div>
</div>

<div class="contentbox-container-left">
			  <div class="contentbox-title-shading bg-yellow07 box-on">&nbsp;</div>
			  <div class="contentbox-title-shading"><asp:HyperLink runat="server" NavigateUrl="~/productlisting.aspx?CatID=15">Professional Road Bikes</asp:HyperLink></div>
        <div class="contentbox-noshading">
            <asp:HyperLink runat="server" NavigateUrl="~/productlisting.aspx?CatID=15"><asp:Image ID="Image1" runat="server" style="left: 5px; position: relative; top: -3px" Height="117px" ImageUrl="~/img/bike3.jpg" Width="190px" /></asp:HyperLink></div>
</div>
</asp:Content>

