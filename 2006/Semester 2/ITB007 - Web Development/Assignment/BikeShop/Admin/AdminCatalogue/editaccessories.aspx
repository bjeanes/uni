<%@ Page AutoEventWireup="false" CodeFile="editaccessories.aspx.vb" Inherits="Admin_AdminCatalogue_editaccessories"
    Language="VB" MasterPageFile="~/Admin/MasterPage.master" Title="The Bike Shop &gt; Admin &gt; Edit Accessories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">
    <div class="content-pagetitle">
        <p>
            EDIT ACCESSORIES</p>
    </div>
    <div class="contentbox-container-full">
        <b>Select a Task:</b><br />
        <asp:HyperLink ID="AddAccessoryLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editaccessories.aspx?TaskID=1"
            Text="Add Accessory Product"></asp:HyperLink><br />
        <asp:HyperLink ID="EditDetailsHyperLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editaccessories.aspx?TaskID=2"
            Text="Edit Accessory Details"></asp:HyperLink><br />
        <asp:HyperLink ID="DeleteAcccessory" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editaccessories.aspx?TaskID=3"
            Text="Delete Accessory Product"></asp:HyperLink><br />
        <asp:HyperLink ID="EditStockHyperLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editaccessories.aspx?TaskID=4"
            Text="Edit Stock"></asp:HyperLink></div>
    <div id="SelectAccessoryDiv" runat="server" class="contentbox-container-left">
        <b>Select an Accessory:</b>
        <table>
            <tbody>
                <tr>
                    <td>
                        Select Type:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAccType" runat="server" AutoPostBack="True" DataSourceID="AccessoryTypeDataSource"
                            DataTextField="CategoryName" DataValueField="CategoryID" Width="100px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select Category:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAccCat" runat="server" AutoPostBack="True" DataSourceID="AccessoryCategoryDataSource"
                            DataTextField="CategoryName" DataValueField="CategoryID" Width="100px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select Product:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAccProduct" runat="server" AutoPostBack="True" DataSourceID="AccessoryProductDataSource"
                            DataTextField="ProductName" DataValueField="ProductID" Width="100px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:AccessDataSource ID="AccessoryTypeDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="ParentCategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessoryCategoryDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [CategoryName], [CategoryID] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAccType" DefaultValue="20" Name="ParentCategoryID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessoryCategoryAltDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([CategoryID] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="22" Name="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessoryProductDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [ProductID], [ProductName] FROM [Products] WHERE ([CategoryID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAccCat" DefaultValue="0" Name="CategoryID" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    <div id="AddAccessoryDiv" runat="server" class="contentbox-container-full">
        <b>Add Accessory Product:</b><br />
        <table style="width: 100%">
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Select Manufacturer:
                </td>
                <td>
                    <asp:DropDownList ID="ddlAddManufacturerID" runat="server" DataSourceID="ManufacturerDataSource"
                        DataTextField="ManufacturerName" DataValueField="ManufacturerID" Width="200px">
                    </asp:DropDownList><asp:AccessDataSource ID="ManufacturerDataSource" runat="server"
                        DataFile="~/App_Data/BikeShopDB.mdb" SelectCommand="SELECT [ManufacturerID], [ManufacturerName] FROM [Manufacturers]">
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Manufacturer Product Code:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddManufacturerProdCode" runat="server" Text="" Width="200px" ValidationGroup="AddProductValidation" MaxLength="15"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ManProdCodeRequiredField" runat="server" ControlToValidate="txtboxAddManufacturerProdCode"
                        Display="Dynamic" ErrorMessage="Manufacturer Product Code is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Product Name:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddProductName" runat="server" Text="" Width="200px" ValidationGroup="AddProductValidation" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductNameRequireField" runat="server" ControlToValidate="txtboxAddProductName"
                        Display="Dynamic" ErrorMessage="Product Name field is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Product Description:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddProductDescription" runat="server" Text="" TextMode="MultiLine" Width="200px" Font-Names="Arial" Font-Size="9pt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Product Picture URL:
                </td>
                <td>
                    <asp:FileUpload ID="uploadAddProductPicURL" runat="server" Width="274px" /></td>
            </tr>
            <tr>
                <td class="bg-blue04" rowspan="2" style="width: 35%">
                    Select Category:
                </td>
                <td>
                    <asp:DropDownList ID="ddlAddAccType" runat="server" AutoPostBack="True" DataSourceID="AccessoryTypeDataSource_Add"
                        DataTextField="CategoryName" DataValueField="CategoryID" Width="200px">
                    </asp:DropDownList><asp:AccessDataSource ID="AccessoryTypeDataSource_Add" runat="server"
                        DataFile="~/App_Data/BikeShopDB.mdb" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="ParentCategoryID" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddlAddAccCat" runat="server" AutoPostBack="True" DataSourceID="AccessoryCategoryDataSource_Add"
                        DataTextField="CategoryName" DataValueField="CategoryID" Width="200px">
                    </asp:DropDownList><asp:AccessDataSource ID="AccessoryCategoryDataSource_Add" runat="server"
                        DataFile="~/App_Data/BikeShopDB.mdb" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlAddAccType" DefaultValue="20" Name="ParentCategoryID"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="AccessoryCategoryAltDataSource_Add" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
                        SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([CategoryID] = ?)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="22" Name="CategoryID" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Units in Stock:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddUnitsInStock" runat="server" Text="" Width="200px" ValidationGroup="AddProductValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UnitsInStockRequired" runat="server" ControlToValidate="txtboxAddUnitsInStock"
                        Display="Dynamic" ErrorMessage="Units in Stock is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Units Price:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddUnitPrice" runat="server" Text="" Width="200px" ValidationGroup="AddProductValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UnitPriceRequired" runat="server" ControlToValidate="txtboxAddUnitPrice"
                        Display="Dynamic" ErrorMessage="Unit Price is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Reorder Level:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddReorderLevel" runat="server" Text="" Width="200px" ValidationGroup="AddProductValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReorderLevelRequired" runat="server" ControlToValidate="txtboxAddReorderLevel"
                        Display="Dynamic" ErrorMessage="Reorder Level is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="AddProductValidationSummary" runat="server" DisplayMode="List"
                        ValidationGroup="AddProductValidation" />
                    <br />
                    <asp:Label ID="lblAddUploadError" runat="server" visible="false" ForeColor="Red" Text="Upload error - Please try again"></asp:Label></td>
            </tr>
        </table>
        <asp:LinkButton ID="AddProductButton" runat="server" CausesValidation="true" CommandName="AddProduct"
            Text="Add Product" ValidationGroup="AddProductValidation"></asp:LinkButton>
        <asp:LinkButton ID="CancelAddButton" runat="server" CausesValidation="false" CommandName="CancelAdd"
            Text="Cancel"></asp:LinkButton>
    </div>
    <div id="EditAccessoryDetailsDiv" runat="server" class="contentbox-container-full">
        <b>Edit Accessory Details:</b>
        <asp:FormView ID="EditAccessoryDetailsFormView" runat="server" DataKeyNames="ProductID"
            DataSourceID="EditAccessoryDetailsDataSource" DefaultMode="Edit">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td class="bg-red04" style="width: 35%">
                            Product ID:
                        </td>
                        <td>
                            <asp:Label ID="ProductIDLabel1" runat="server" Text='<%# Eval("ProductID") %>' Width="200px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 35%">
                            Manufacturer ID:
                        </td>
                        <td>
                            <asp:TextBox ID="ManufacturerIDTextBox" runat="server" Text='<%# Bind("ManufacturerID") %>'
                                Width="200px" ValidationGroup="EditAccessoryValidation"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EditManIDRequired" runat="server" ErrorMessage="Manufacturer ID is required" ControlToValidate="ManufacturerIDTextBox" Display="Dynamic" ValidationGroup="EditAccessoryValidation">*</asp:RequiredFieldValidator>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 35%">
                            Manufacturer Product Code:
                        </td>
                        <td>
                            <asp:TextBox ID="ManufacturerProductCodeTextBox" runat="server" Text='<%# Bind("ManufacturerProductCode") %>'
                                Width="200px" MaxLength="15" ValidationGroup="EditAccessoryValidation"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EditManProdCodeRequired" runat="server" ControlToValidate="ManufacturerProductCodeTextBox"
                                Display="Dynamic" ErrorMessage="Manufacturer Product Code is Required" ValidationGroup="EditAccessoryValidation">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 35%">
                            Product Name:
                        </td>
                        <td>
                            <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>'
                                Width="200px" MaxLength="30" ValidationGroup="EditAccessoryValidation"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EditProdNameRequired" runat="server" ControlToValidate="ProductNameTextBox"
                                Display="Dynamic" ErrorMessage="Product Name is Required" ValidationGroup="EditAccessoryValidation">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 35%">
                            Product Description:
                        </td>
                        <td>
                            <asp:TextBox ID="ProductDescriptionTextBox" runat="server" Text='<%# Bind("ProductDescription") %>'
                                TextMode="MultiLine" Width="200px" Font-Names="Arial" Font-Size="9pt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 35%">
                            Product Picture URL:
                        </td>
                        <td>
                            <asp:TextBox ID="ProductPicURLTextBox" runat="server" Text='<%# Bind("ProductPicURL") %>'
                                Width="200px" MaxLength="250" ValidationGroup="EditAccessoryValidation"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 35%">
                            Category ID:
                        </td>
                        <td>
                            <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>'
                                Width="200px" ValidationGroup="EditAccessoryValidation"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EditCatIDRequired" runat="server" ErrorMessage="Category ID is Required" ControlToValidate="CategoryIDTextBox" ValidationGroup="EditAccessoryValidation">*</asp:RequiredFieldValidator></td>
                    </tr>
                </table>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                    ValidationGroup="EditAccessoryValidation" />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" ValidationGroup="EditAccessoryValidation"></asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td class="bg-blue04" style="width: 25%">
                            Product ID:
                        </td>
                        <td>
                            <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 25%">
                            Manufacturer ID:
                        </td>
                        <td>
                            <asp:Label ID="ManufacturerIDLabel" runat="server" Text='<%# Bind("ManufacturerID") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 25%">
                            Manufacturer Product Code:
                        </td>
                        <td>
                            <asp:Label ID="ManufacturerProductCodeLabel" runat="server" Text='<%# Bind("ManufacturerProductCode") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 25%">
                            Product Name:
                        </td>
                        <td>
                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 25%">
                            Product Description:
                        </td>
                        <td>
                            <asp:Label ID="ProductDescriptionLabel" runat="server" Text='<%# Bind("ProductDescription") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 25%">
                            Product Picture URL:
                        </td>
                        <td>
                            <asp:Label ID="ProductPicURLLabel" runat="server" Text='<%# Bind("ProductPicURL") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 25%">
                            Category ID:
                        </td>
                        <td>
                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete">
                </asp:LinkButton>
                <asp:HyperLink ID="DeleteCancelLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editaccessories.aspx"
                    Text="Cancel"></asp:HyperLink>
            </ItemTemplate>
        </asp:FormView>
        <asp:AccessDataSource ID="EditAccessoryDetailsDataSource" runat="server" ConflictDetection="CompareAllValues"
            DataFile="~/App_Data/BikeShopDB.mdb" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ? AND [ManufacturerID] = ? AND [ManufacturerProductCode] = ? AND [ProductName] = ? AND [ProductDescription] = ? AND [ProductPicURL] = ? AND [CategoryID] = ?"
            InsertCommand="INSERT INTO [Products] ([ProductID], [ManufacturerID], [ManufacturerProductCode], [ProductName], [ProductDescription], [ProductPicURL], [CategoryID]) VALUES (?, ?, ?, ?, ?, ?, ?)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProductID], [ManufacturerID], [ManufacturerProductCode], [ProductName], [ProductDescription], [ProductPicURL], [CategoryID] FROM [Products] WHERE ([ProductID] = ?)"
            UpdateCommand="UPDATE [Products] SET [ManufacturerID] = ?, [ManufacturerProductCode] = ?, [ProductName] = ?, [ProductDescription] = ?, [ProductPicURL] = ?, [CategoryID] = ? WHERE [ProductID] = ? AND [ManufacturerID] = ? AND [ManufacturerProductCode] = ? AND [ProductName] = ? AND [ProductDescription] = ? AND [ProductPicURL] = ? AND [CategoryID] = ?">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAccProduct" DefaultValue="0" Name="ProductID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_ManufacturerID" Type="Int32" />
                <asp:Parameter Name="original_ManufacturerProductCode" Type="String" />
                <asp:Parameter Name="original_ProductName" Type="String" />
                <asp:Parameter Name="original_ProductDescription" Type="String" />
                <asp:Parameter Name="original_ProductPicURL" Type="String" />
                <asp:Parameter Name="original_CategoryID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ManufacturerID" Type="Int32" />
                <asp:Parameter Name="ManufacturerProductCode" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="ProductDescription" Type="String" />
                <asp:Parameter Name="ProductPicURL" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_ManufacturerID" Type="Int32" />
                <asp:Parameter Name="original_ManufacturerProductCode" Type="String" />
                <asp:Parameter Name="original_ProductName" Type="String" />
                <asp:Parameter Name="original_ProductDescription" Type="String" />
                <asp:Parameter Name="original_ProductPicURL" Type="String" />
                <asp:Parameter Name="original_CategoryID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="ManufacturerID" Type="Int32" />
                <asp:Parameter Name="ManufacturerProductCode" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="ProductDescription" Type="String" />
                <asp:Parameter Name="ProductPicURL" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </InsertParameters>
        </asp:AccessDataSource>
    </div>
    <div id="EditStockDiv" runat="server" class="contentbox-container-full">
        <b>Edit Stock Details:<br />
        </b>
        <asp:DetailsView ID="EditStockDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="ProductID"
            DataSourceID="EditStockDataSource" Height="50px" Width="194px">
            <Fields>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False"
                    ReadOnly="True" SortExpression="ProductID" >
                    <HeaderStyle CssClass="bg-blue04" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" >
                    <HeaderStyle CssClass="bg-blue04" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock" >
                    <HeaderStyle CssClass="bg-blue04" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" >
                    <HeaderStyle CssClass="bg-blue04" />
                </asp:BoundField>
                <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" >
                    <HeaderStyle CssClass="bg-blue04" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" >
                    <HeaderStyle CssClass="bg-blue04" />
                </asp:CheckBoxField>
            </Fields>
        </asp:DetailsView>
        <asp:AccessDataSource ID="EditStockDataSource" runat="server" ConflictDetection="CompareAllValues"
            DataFile="~/App_Data/BikeShopDB.mdb" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ? AND [ProductName] = ? AND [UnitsInStock] = ? AND [UnitPrice] = ? AND [ReorderLevel] = ? AND [Discontinued] = ?"
            InsertCommand="INSERT INTO [Products] ([ProductID], [ProductName], [UnitsInStock], [UnitPrice], [ReorderLevel], [Discontinued]) VALUES (?, ?, ?, ?, ?, ?)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProductID], [ProductName], [UnitsInStock], [UnitPrice], [ReorderLevel], [Discontinued] FROM [Products] WHERE ([ProductID] = ?)"
            UpdateCommand="UPDATE [Products] SET [ProductName] = ?, [UnitsInStock] = ?, [UnitPrice] = ?, [ReorderLevel] = ?, [Discontinued] = ? WHERE [ProductID] = ? AND [ProductName] = ? AND [UnitsInStock] = ? AND [UnitPrice] = ? AND [ReorderLevel] = ? AND [Discontinued] = ?">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAccProduct" DefaultValue="0" Name="ProductID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_ProductName" Type="String" />
                <asp:Parameter Name="original_UnitsInStock" Type="Int16" />
                <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                <asp:Parameter Name="original_ReorderLevel" Type="Int16" />
                <asp:Parameter Name="original_Discontinued" Type="Boolean" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="UnitsInStock" Type="Int16" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="ReorderLevel" Type="Int16" />
                <asp:Parameter Name="Discontinued" Type="Boolean" />
                <asp:Parameter Name="original_ProductID" Type="Int32" />
                <asp:Parameter Name="original_ProductName" Type="String" />
                <asp:Parameter Name="original_UnitsInStock" Type="Int16" />
                <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                <asp:Parameter Name="original_ReorderLevel" Type="Int16" />
                <asp:Parameter Name="original_Discontinued" Type="Boolean" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="UnitsInStock" Type="Int16" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="ReorderLevel" Type="Int16" />
                <asp:Parameter Name="Discontinued" Type="Boolean" />
            </InsertParameters>
        </asp:AccessDataSource>
        <div id="EditStockOptionsDiv" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:LinkButton ID="DiscontinueProductButton" runat="server" CausesValidation="true"
                            CommandName="DiscontinueProduct" Text="Discontinue Product"></asp:LinkButton></td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="AdjustStockButton" runat="server" CausesValidation="true" CommandName="AdjustStock"
                            Text="Adjust Stock Levels"></asp:LinkButton></td>
                </tr>
                <tr>
                    <td>
                        <div id="AdjustStockDiv" runat="server" visible="false" class="bg-red03">
                            New Stock Amount:
                            <asp:TextBox ID="NewStockTextBox" runat="server" Text=""></asp:TextBox><br />
                            <asp:LinkButton ID="UpdateStockLinkButton" runat="server" CausesValidation="true"
                                CommandName="UpdateStock" Text="Update"></asp:LinkButton>
                            <asp:LinkButton ID="CancelStockUpdateLinkButton" runat="server" CausesValidation="false"
                                CommandName="CancelStockUpdate" Text="Cancel"></asp:LinkButton>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="AdjustPriceButton" runat="server" CausesValidation="true" CommandName="AdjustPrice"
                            Text="Adjust Price"></asp:LinkButton></td>
                </tr>
                <tr>
                    <td>
                        <div id="AdjustPriceDiv" runat="server" class="bg-red03" visible="false">
                            New Price:
                            <asp:TextBox ID="NewPriceTextBox" runat="server" Text=""></asp:TextBox><br />
                            <asp:LinkButton ID="UpdatePriceLinkButton" runat="server" CausesValidation="true"
                                CommandName="UpdatePrice" Text="Update"></asp:LinkButton>
                            <asp:LinkButton ID="CancelPriceUpdateLinkButton" runat="server" CausesValidation="false"
                                CommandName="CancelPriceUpdate" Text="Cancel"></asp:LinkButton>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>


