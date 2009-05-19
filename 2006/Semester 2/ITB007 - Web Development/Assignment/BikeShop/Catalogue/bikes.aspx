<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="bikes.aspx.vb" Inherits="bikes" title="The Bike Shop &gt; Catalogue &gt; Bikes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">

<div class="content-pagetitle"><p>BIKES -- Select a category</p></div>
    <br />
    <br />
    <br />
			
			<div class="contentbox-container-left">
			  <div class="contentbox-title-shading bg-red07 box-on">&nbsp;</div>
			  <div class="contentbox-title-shading"><a href="Bikes/mountain.aspx">Mountain Bikes</a></div>
        <div class="contentbox-noshading">
            <asp:Image ID="Image3" runat="server" style="left: 5px; position: relative; top: -3px" Height="117px" ImageUrl="~/img/bike1.jpg" Width="190px" /></div>
      </div>
      
<div class="contentbox-container-right">
			  <div class="contentbox-title-shading bg-green07 box-on">&nbsp;</div>
			  <div class="contentbox-title-shading"><a href="Bikes/bmx.aspx">BMX Bikes</a></div>
        <div class="contentbox-noshading">
            <asp:Image ID="Image2" runat="server" style="left: 5px; position: relative; top: -3px" Height="117px" ImageUrl="~/img/bike2.jpg" Width="190px" /></div>
</div>

<div class="contentbox-container-left">
			  <div class="contentbox-title-shading bg-yellow07 box-on">&nbsp;</div>
			  <div class="contentbox-title-shading"><a href="Bikes/road.aspx">Road Bikes</a></div>
        <div class="contentbox-noshading">
            <asp:Image ID="Image1" runat="server" style="left: 5px; position: relative; top: -3px" Height="117px" ImageUrl="~/img/bike3.jpg" Width="190px" /></div>
</div>

</asp:Content>

