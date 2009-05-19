<%@ Page AutoEventWireup="false" CodeFile="editparts.aspx.vb" Inherits="Admin_AdminCatalogue_editparts"
    Language="VB" MasterPageFile="~/Admin/MasterPage.master" Title="The Bike Shop &gt; Admin &gt; Edit Parts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">
    <div class="content-pagetitle">
        <p>
            EDIT PARTS</p>
    </div>
    <div class="contentbox-container-full">
        <b>Select a Task:</b><br />
        <asp:HyperLink ID="AddPartLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editparts.aspx?TaskID=1"
            Text="Add Part"></asp:HyperLink><br />
        <asp:HyperLink ID="EditDetailsHyperLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editparts.aspx?TaskID=2"
            Text="Edit Part Details"></asp:HyperLink><br />
        <asp:HyperLink ID="DeletePartLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editparts.aspx?TaskID=3"
            Text="Delete Part"></asp:HyperLink><br />
        <asp:HyperLink ID="EditStockHyperLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editparts.aspx?TaskID=4"
            Text="Edit Stock"></asp:HyperLink></div>
    <div id="SelectPartDiv" runat="server" class="contentbox-container-left">
        <b>Select a Part:</b>
        <table>
            <tbody>
                <tr>
                    <td>
                        Select Type:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPartType" runat="server" AutoPostBack="True" DataSourceID="PartsTypeDataSource"
                            DataTextField="CategoryName" DataValueField="CategoryID" Width="100px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select Product:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPartsProduct" runat="server" AutoPostBack="True" DataSourceID="PartsProductDataSource"
                            DataTextField="ProductName" DataValueField="ProductID" Width="100px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:AccessDataSource ID="PartsTypeDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ParentCategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="PartsProductDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [ProductID], [ProductName] FROM [Products] WHERE ([CategoryID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPartType" DefaultValue="0" Name="CategoryID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    <div id="AddPartDiv" runat="server" class="contentbox-container-full">
        <b>Add Part Product:</b><br />
        <table style="width: 100%">
            <tbody>
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
                        <asp:TextBox ID="txtboxAddManufacturerProdCode" runat="server" MaxLength="15" Text=""
                            ValidationGroup="AddProductValidation" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ManProdCodeRequiredField" runat="server" ControlToValidate="txtboxAddManufacturerProdCode"
                            Display="Dynamic" ErrorMessage="Manufacturer Product Code is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="bg-blue04" style="width: 35%">
                        Product Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtboxAddProductName" runat="server" MaxLength="30" Text="" ValidationGroup="AddProductValidation"
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ProductNameRequireField" runat="server" ControlToValidate="txtboxAddProductName"
                            Display="Dynamic" ErrorMessage="Product Name field is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="bg-blue04" style="width: 35%">
                        Product Description:
                    </td>
                    <td>
                        <asp:TextBox ID="txtboxAddProductDescription" runat="server" Font-Names="Arial" Font-Size="9pt"
                            Text="" TextMode="MultiLine" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="bg-blue04" style="width: 35%; height: 26px;">
                        Product Picture URL:
                    </td>
                    <td style="height: 26px">
                        <asp:FileUpload ID="uploadAddProductPicURL" runat="server" Width="258px" /></td>
                </tr>
                <tr>
                    <td class="bg-blue04" style="width: 35%">
                        Select Category:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAddPartType" runat="server" AutoPostBack="True" DataSourceID="AccessoryTypeDataSource_Add"
                            DataTextField="CategoryName" DataValueField="CategoryID" Width="200px">
                        </asp:DropDownList><asp:AccessDataSource ID="AccessoryTypeDataSource_Add" runat="server"
                            DataFile="~/App_Data/BikeShopDB.mdb" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="ParentCategoryID" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="bg-blue04" style="width: 35%">
                        Units in Stock:
                    </td>
                    <td>
                        <asp:TextBox ID="txtboxAddUnitsInStock" runat="server" Text="" ValidationGroup="AddProductValidation"
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UnitsInStockRequired" runat="server" ControlToValidate="txtboxAddUnitsInStock"
                            Display="Dynamic" ErrorMessage="Units in Stock is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="bg-blue04" style="width: 35%">
                        Units Price:
                    </td>
                    <td>
                        <asp:TextBox ID="txtboxAddUnitPrice" runat="server" Text="" ValidationGroup="AddProductValidation"
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UnitPriceRequired" runat="server" ControlToValidate="txtboxAddUnitPrice"
                            Display="Dynamic" ErrorMessage="Unit Price is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="bg-blue04" style="width: 35%">
                        Reorder Level:
                    </td>
                    <td>
                        <asp:TextBox ID="txtboxAddReorderLevel" runat="server" Text="" ValidationGroup="AddProductValidation"
                            Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReorderLevelRequired" runat="server" ControlToValidate="txtboxAddReorderLevel"
                            Display="Dynamic" ErrorMessage="Reorder Level is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="AddProductValidationSummary" runat="server" DisplayMode="List"
                            ValidationGroup="AddProductValidation" />
                        <br />
                        <asp:Label ID="lblAddUploadError" runat="server" ForeColor="Red" Text="Error uploading - Please try again"
                            Visible="False"></asp:Label></td>
                </tr>
            </tbody>
        </table>
        <asp:LinkButton ID="AddProductButton" runat="server" CausesValidation="true" CommandName="AddProduct"
            Text="Add Product" ValidationGroup="AddProductValidation"></asp:LinkButton>
        <asp:LinkButton ID="CancelAddButton" runat="server" CausesValidation="false" CommandName="CancelAdd"
            Text="Cancel"></asp:LinkButton>
    </div>
    <div id="EditPartsDetailsDiv" runat="server" class="contentbox-container-full">
        <b>Edit Part Details:</b>
        <asp:FormView ID="EditPartDetailsFormView" runat="server" DataKeyNames="ProductID"
            DataSourceID="EditPartDetailsDataSource" DefaultMode="Edit">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td class="bg-red04" style="width: 100px">
                            ProductID:</td>
                        <td>
                            <asp:Label ID="ProductIDLabel1" runat="server" Text='<%# Eval("ProductID") %>' Width="250px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 100px">
                            ManufacturerID:</td>
                        <td>
                            <asp:TextBox ID="ManufacturerIDTextBox" runat="server" Text='<%# Bind("ManufacturerID") %>'
                                ValidationGroup="EditDetailsValidation" Width="250px">
                            </asp:TextBox><asp:RequiredFieldValidator ID="ManIDRequiredField" runat="server"
                                ControlToValidate="ManufacturerIDTextBox" Display="Dynamic" ErrorMessage="Manufacturer ID is Required"
                                ValidationGroup="EditDetailsValidation">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 100px">
                            ManufacturerProductCode:</td>
                        <td>
                            <asp:TextBox ID="ManufacturerProductCodeTextBox" runat="server" Text='<%# Bind("ManufacturerProductCode") %>'
                                ValidationGroup="EditDetailsValidation" Width="250px">
                            </asp:TextBox><asp:RequiredFieldValidator ID="ManProdCodeRequiredField" runat="server"
                                ControlToValidate="ManufacturerProductCodeTextBox" Display="Dynamic" ErrorMessage="Manufacturer Product Code is Required"
                                ValidationGroup="EditDetailsValidation">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 100px">
                            ProductName:</td>
                        <td>
                            <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>'
                                ValidationGroup="EditDetailsValidation" Width="250px">
                            </asp:TextBox><asp:RequiredFieldValidator ID="ProductNameRequiredField" runat="server"
                                ControlToValidate="ProductNameTextBox" Display="Dynamic" ErrorMessage="Product Name is Required"
                                ValidationGroup="EditDetailsValidation">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 100px">
                            ProductDescription:</td>
                        <td>
                            <asp:TextBox ID="ProductDescriptionTextBox" runat="server" Text='<%# Bind("ProductDescription") %>'
                                TextMode="MultiLine" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 100px">
                            ProductPicURL:</td>
                        <td>
                            <asp:TextBox ID="ProductPicURLTextBox" runat="server" Text='<%# Bind("ProductPicURL") %>'
                                Width="250px">
                            </asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="bg-red04" style="width: 100px">
                            CategoryID:</td>
                        <td>
                            <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>'
                                ValidationGroup="EditDetailsValidation" Width="250px">
                            </asp:TextBox><asp:RequiredFieldValidator ID="CategoryIDRequiredField" runat="server"
                                ControlToValidate="CategoryIDTextBox" Display="Dynamic" ErrorMessage="Category ID is Required"
                                ValidationGroup="EditDetailsValidation">*</asp:RequiredFieldValidator></td>
                    </tr>
                </table>
                <asp:ValidationSummary ID="EditDetailsValidationSummary" runat="server" DisplayMode="List"
                    ValidationGroup="EditDetailsValidation" />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" ValidationGroup="EditDetailsValidation">
                </asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel">
                </asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td class="bg-blue04" style="width: 100px">
                            ProductID:</td>
                        <td>
                            <asp:Label ID="ProductIDLabel1" runat="server" Text='<%# Eval("ProductID") %>' Width="250px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 100px">
                            ManufacturerID:</td>
                        <td>
                            <asp:Label ID="ManufacturerIDLabel" runat="server" Text='<%# Bind("ManufacturerID") %>'
                                Width="250px">
                            </asp:Label></td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 100px">
                            ManufacturerProductCode:</td>
                        <td>
                            <asp:Label ID="ManufacturerProductCodeLabel" runat="server" Text='<%# Bind("ManufacturerProductCode") %>'
                                Width="250px">
                            </asp:Label></td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 100px">
                            ProductName:</td>
                        <td>
                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>'
                                Width="250px">
                            </asp:Label></td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 100px">
                            ProductDescription:</td>
                        <td>
                            <asp:Label ID="ProductDescriptionLabel" runat="server" Text='<%# Bind("ProductDescription") %>'
                                Width="250px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 100px">
                            ProductPicURL:</td>
                        <td>
                            <asp:Label ID="ProductPicURLLabel" runat="server" Text='<%# Bind("ProductPicURL") %>'
                                Width="250px">
                            </asp:Label></td>
                    </tr>
                    <tr>
                        <td class="bg-blue04" style="width: 100px">
                            CategoryID:</td>
                        <td>
                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>' Width="250px">
                            </asp:Label></td>
                    </tr>
                </table>
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete">
                </asp:LinkButton>
            </ItemTemplate>
        </asp:FormView>
        <asp:AccessDataSource ID="EditPartDetailsDataSource" runat="server"
            DataFile="~/App_Data/BikeShopDB.mdb" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ?"
            InsertCommand="INSERT INTO [Products] ([ProductID], [ManufacturerID], [ManufacturerProductCode], [ProductName], [ProductDescription], [ProductPicURL], [CategoryID]) VALUES (?, ?, ?, ?, ?, ?, ?)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProductID], [ManufacturerID], [ManufacturerProductCode], [ProductName], [ProductDescription], [ProductPicURL], [CategoryID] FROM [Products] WHERE ([ProductID] = ?)"
            UpdateCommand="UPDATE [Products] SET [ManufacturerID] = ?, [ManufacturerProductCode] = ?, [ProductName] = ?, [ProductDescription] = ?, [ProductPicURL] = ?, [CategoryID] = ? WHERE [ProductID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_ProductID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ManufacturerID" Type="Int32" />
                <asp:Parameter Name="ManufacturerProductCode" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="ProductDescription" Type="String" />
                <asp:Parameter Name="ProductPicURL" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="original_ProductID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPartsProduct" DefaultValue="0" Name="ProductID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
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
        <asp:DetailsView ID="EditStockDetailsView" runat="server" AutoGenerateRows="False"
            DataKeyNames="ProductID" DataSourceID="EditStockDataSource" Height="50px" Width="194px">
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
                <asp:ControlParameter ControlID="ddlPartsProduct" DefaultValue="0" Name="ProductID"
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
                <tbody>
                    <tr>
                        <td style="width: 246px">
                            <asp:LinkButton ID="DiscontinueProductButton" runat="server" CausesValidation="true"
                                CommandName="DiscontinueProduct" Text="Discontinue Product"></asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td style="width: 246px">
                            <asp:LinkButton ID="AdjustStockButton" runat="server" CausesValidation="true" CommandName="AdjustStock"
                                Text="Adjust Stock Levels"></asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td style="width: 246px">
                            <div id="AdjustStockDiv" runat="server" class="bg-red03" visible="false">
                                New Stock Amount:
                                <asp:TextBox ID="NewStockTextBox" runat="server" Text=""></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="UpdateStockRequiredField" runat="server" ControlToValidate="NewStockTextBox"
                                    Display="Dynamic" ErrorMessage="Please enter a Stock Amount" ValidationGroup="UpdateStockValidation"></asp:RequiredFieldValidator><br />
                                <asp:LinkButton ID="UpdateStockLinkButton" runat="server" CausesValidation="true"
                                    CommandName="UpdateStock" Text="Update" ValidationGroup="UpdateStockValidation"></asp:LinkButton>
                                <asp:LinkButton ID="CancelStockUpdateLinkButton" runat="server" CausesValidation="false"
                                    CommandName="CancelStockUpdate" Text="Cancel"></asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 246px">
                            <asp:LinkButton ID="AdjustPriceButton" runat="server" CausesValidation="true" CommandName="AdjustPrice"
                                Text="Adjust Price"></asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td style="width: 246px">
                            <div id="AdjustPriceDiv" runat="server" class="bg-red03" visible="false">
                                New Price:
                                <asp:TextBox ID="NewPriceTextBox" runat="server" Text=""></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="UpdatePriceRequiredField" runat="server" ControlToValidate="NewPriceTextBox"
                                    Display="Dynamic" ErrorMessage="Please enter a New Price" ValidationGroup="UpdatePriceValidation"></asp:RequiredFieldValidator><br />
                                <asp:LinkButton ID="UpdatePriceLinkButton" runat="server" CausesValidation="true"
                                    CommandName="UpdatePrice" Text="Update" ValidationGroup="UpdatePriceValidation"></asp:LinkButton>
                                <asp:LinkButton ID="CancelPriceUpdateLinkButton" runat="server" CausesValidation="false"
                                    CommandName="CancelPriceUpdate" Text="Cancel"></asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

