<%@ Page AutoEventWireup="false" CodeFile="editbikes.aspx.vb" Inherits="Admin_AdminCatalogue_editbikes"
    Language="VB" MasterPageFile="~/Admin/MasterPage.master" Title="The Bike Shop &gt; Admin &gt; Edit Bikes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentMainPlaceHolder" Runat="Server">

    <div class="content-pagetitle">
        <p>
            EDIT BIKES</p>
    </div>
    <div class="contentbox-container-full">
        <b>Select a Task:</b><br />
        <asp:HyperLink ID="AddBikeLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editbikes.aspx?TaskID=1"
            Text="Add Bike"></asp:HyperLink><br />
        <asp:HyperLink ID="EditDetailsHyperLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editbikes.aspx?TaskID=2"
            Text="Edit Bike Details"></asp:HyperLink><br />
        <asp:HyperLink ID="DeleteBikeHyperLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editbikes.aspx?TaskID=3"
            Text="Delete Bike"></asp:HyperLink><br />
        <asp:HyperLink ID="EditStockHyperLink" runat="server" NavigateUrl="~/Admin/AdminCatalogue/editbikes.aspx?TaskID=4"
            Text="Edit Stock"></asp:HyperLink></div>
    <div id="SelectBikeDiv" runat="server" class="contentbox-container-left">
        <b>Select a Bike:</b>
        <table>
            <tr>
                <td>
                    Select Type:
                </td>
                <td>
                    <asp:DropDownList ID="ddlBikeType" runat="server" AutoPostBack="True" DataSourceID="BikeTypeDatasource"
                        DataTextField="CategoryName" DataValueField="CategoryID" Width="100px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Select Category:
                </td>
                <td>
                    <asp:DropDownList ID="ddlBikeCat" runat="server" AutoPostBack="True" DataSourceID="BikeCategoryDataSource"
                        DataTextField="CategoryName" DataValueField="CategoryID" Width="100px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Select Product:
                </td>
                <td>
                    <asp:DropDownList ID="ddlBikeProduct" runat="server" AutoPostBack="True" DataSourceID="BikeProductDataSource"
                        DataTextField="ProductName" DataValueField="ProductID" Width="100px">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        &nbsp;&nbsp;
        <asp:AccessDataSource ID="BikeProductDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [ProductID], [ProductName] FROM [Products] WHERE ([CategoryID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlBikeCat" DefaultValue="7" Name="CategoryID" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="BikeCategoryDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlBikeType" DefaultValue="4" Name="ParentCategoryID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="BikeTypeDatasource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="ParentCategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    <br />
    <div id="EditBikeDetailsDiv" runat="server" class="contentbox-container-full">
        <b>Edit Bike Details:</b><br />
            <asp:FormView ID="EditBikeDetailsFormView" runat="server" DataKeyNames="ProductID"
                DataSourceID="EditBikeDetailsDataSource" DefaultMode="Edit">
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td class="bg-red04" style="width:100px">
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
                    <asp:RegularExpressionValidator ID="RegExManufacturer" ValidationGroup="EditDetailsValidation" runat="server" ErrorMessage="The manufacturer ID cannot contain alphanumeric characters." ControlToValidate="ManufacturerIDTextBox" ValidationExpression="^([1-9]\d*)$|^0$"></asp:RegularExpressionValidator><br />   
                    <asp:RegularExpressionValidator ID="RegExCategory" ValidationGroup="EditDetailsValidation" runat="server" ErrorMessage="The category ID cannot contain alphanumeric characters." ControlToValidate="CategoryIDTextBox" ValidationExpression="^([1-9]\d*)$|^0$"></asp:RegularExpressionValidator><br /> 
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
                                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>'
                                    Width="250px">
                                </asp:Label></td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="Delete">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:FormView>
            <asp:AccessDataSource ID="EditBikeDetailsDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
                DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ?" InsertCommand="INSERT INTO [Products] ([ProductID], [ManufacturerID], [ManufacturerProductCode], [ProductName], [ProductDescription], [ProductPicURL], [CategoryID]) VALUES (?, ?, ?, ?, ?, ?, ?)"
                SelectCommand="SELECT [ProductID], [ManufacturerID], [ManufacturerProductCode], [ProductName], [ProductDescription], [ProductPicURL], [CategoryID] FROM [Products] WHERE ([ProductID] = ?)"
                UpdateCommand="UPDATE [Products] SET [ManufacturerID] = ?, [ManufacturerProductCode] = ?, [ProductName] = ?, [ProductDescription] = ?, [ProductPicURL] = ?, [CategoryID] = ? WHERE [ProductID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ManufacturerID" Type="Int32" />
                    <asp:Parameter Name="ManufacturerProductCode" Type="String" />
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDescription" Type="String" />
                    <asp:Parameter Name="ProductPicURL" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlBikeProduct" DefaultValue="0" Name="ProductID"
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
    <div id="AddBikeDiv" runat="server" class="contentbox-container-full">
    <b>Add Bike:</b><br />
        <table style="width:100%">
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Select Manufacturer:
                </td>
                <td>
                    <asp:DropDownList ID="ddlAddManufacturerID" runat="server" DataSourceID="ManufacturerDataSource"
                        DataTextField="ManufacturerName" DataValueField="ManufacturerID">
                    </asp:DropDownList><asp:AccessDataSource ID="ManufacturerDataSource" runat="server"
                        DataFile="~/App_Data/BikeShopDB.mdb" SelectCommand="SELECT [ManufacturerID], [ManufacturerName] FROM [Manufacturers]">
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" rowspan="2" style="width: 35%">
                    Select Category:
                </td>
                <td>
                    <asp:DropDownList ID="ddlAddBikeType" runat="server" DataSourceID="BikeTypeDataSource_Add"
                        DataTextField="CategoryName" DataValueField="CategoryID" Style="width: 150px" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="BikeTypeDataSource_Add" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
                        SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="ParentCategoryID" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddlAddBikeCategory" runat="server" DataSourceID="BikeCategoryDataSource_Add"
                        DataTextField="CategoryName" DataValueField="CategoryID" Style="width: 150px" AutoPostBack="True">
                    </asp:DropDownList><asp:AccessDataSource ID="BikeCategoryDataSource_Add" runat="server"
                        DataFile="~/App_Data/BikeShopDB.mdb" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories] WHERE ([ParentCategoryID] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlAddBikeType" DefaultValue="4" Name="ParentCategoryID"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Manufacturer Product Code:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddManufacturerProdCode" runat="server" Text="" ValidationGroup="AddProductValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="AddManProductRequiredField" runat="server" ControlToValidate="txtboxAddManufacturerProdCode"
                        Display="Dynamic" ErrorMessage="Manufacturer Product Code is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Product Name:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddProductName" runat="server" Text="" ValidationGroup="AddProductValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductNameRequiredField" runat="server" ControlToValidate="txtboxAddProductName"
                        ErrorMessage="Product Name is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Product Picture URL:
                </td>
                <td>
                    <asp:FileUpload ID="uploadAddProductPicURL" runat="server" /></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width:35%">
                    Units in Stock:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddUnitsInStock" runat="server" Text="" ValidationGroup="AddProductValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UnitsInStockRequiredField" runat="server" ControlToValidate="txtboxAddUnitsInStock"
                        Display="Dynamic" ErrorMessage="Units in Stock is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Units Price:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddUnitPrice" runat="server" Text="" ValidationGroup="AddProductValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UnitPriceRequiredField" runat="server" ControlToValidate="txtboxAddUnitPrice"
                        Display="Dynamic" ErrorMessage="Unit Price is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Reorder Level:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddReorderLevel" runat="server" Text="" ValidationGroup="AddProductValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReorderLevelRequiredField" runat="server" ControlToValidate="txtboxAddReorderLevel"
                        ErrorMessage="Reorder Level is Required" ValidationGroup="AddProductValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                   Year Made:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddYearMade" runat="server" Text="" ValidationGroup="AddProductValidation" MaxLength="5"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Frame:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddFrame" runat="server" Text="" ValidationGroup="AddProductValidation" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Forks:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddForks" runat="server" Text="" ValidationGroup="AddProductValidation" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Brakes:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddBrakes" runat="server" Text="" ValidationGroup="AddProductValidation" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Cranks:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddCranks" runat="server" Text="" ValidationGroup="AddProductValidation" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Pedals:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddPedals" runat="server" Text="" ValidationGroup="AddProductValidation" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="bg-blue04" style="width: 35%">
                    Rear Shock:
                </td>
                <td>
                    <asp:TextBox ID="txtboxAddRearShock" runat="server" Text="" ValidationGroup="AddProductValidation" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblAddUploadError" runat="server" ForeColor="Red" Text="Upload File Error - Please try again"
            Visible="False"></asp:Label><br />
        <asp:RegularExpressionValidator ID="RegExStock" ValidationGroup="AddProductValidation" runat="server" ErrorMessage="The stock level cannot contain alphanumeric characters." ControlToValidate="txtboxAddUnitsInStock" ValidationExpression="^([1-9]\d*)$|^0$"></asp:RegularExpressionValidator><br />
        <asp:RegularExpressionValidator ID="RegExPrice" ValidationGroup="AddProductValidation" runat="server" ErrorMessage="The unit price cannot contain alphanumeric characters." ControlToValidate="txtboxAddUnitPrice" ValidationExpression="^([1-9]\d*)$|^0$"></asp:RegularExpressionValidator><br />  
        <asp:RegularExpressionValidator ID="RegExReorder" ValidationGroup="AddProductValidation" runat="server" ErrorMessage="The reorder level cannot contain alphanumeric characters." ControlToValidate="txtboxAddReorderLevel" ValidationExpression="^([1-9]\d*)$|^0$"></asp:RegularExpressionValidator><br />  
        <asp:RegularExpressionValidator ID="RegExYearMade" ValidationGroup="AddProductValidation" runat="server" ErrorMessage="The year made cannot contain alphanumeric characters." ControlToValidate="txtboxAddYearMade" ValidationExpression="^([1-9]\d*)$|^0$"></asp:RegularExpressionValidator><br />  
        
        
        <asp:LinkButton ID="AddProductButton" runat="server" CausesValidation="true" CommandName="AddProduct"
            Text="Add Product" ValidationGroup="AddProductValidation"></asp:LinkButton>
        <asp:LinkButton ID="CancelAddButton" runat="server" CausesValidation="false" CommandName="CancelAdd"
            Text="Cancel"></asp:LinkButton>
    </div>
    <div id="EditStockDiv" runat="server" class="contentbox-container-full">
    <b>Edit Stock Details:</b>
        <asp:DetailsView ID="EditStockDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="ProductID"
            DataSourceID="EditStockDataSource" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False"
                    ReadOnly="True" SortExpression="ProductID" >
                    <HeaderStyle CssClass="bg-red04" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" >
                    <HeaderStyle CssClass="bg-red04" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock" >
                    <HeaderStyle CssClass="bg-red04" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" >
                    <HeaderStyle CssClass="bg-red04" />
                </asp:BoundField>
                <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" >
                    <HeaderStyle CssClass="bg-red04" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" >
                    <HeaderStyle CssClass="bg-red04" />
                </asp:CheckBoxField>
            </Fields>
        </asp:DetailsView>
        <asp:AccessDataSource ID="EditStockDataSource" runat="server" DataFile="~/App_Data/BikeShopDB.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [UnitsInStock], [UnitPrice], [ReorderLevel], [Discontinued] FROM [Products] WHERE ([ProductID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlBikeProduct" DefaultValue="0" Name="ProductID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
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
                        <div id="AdjustStockDiv" runat="server" class="bg-red03" visible="false">
                            New Stock Amount:
                            <asp:TextBox ID="NewStockTextBox" runat="server" Text="" ValidationGroup="StockValidation"></asp:TextBox><br />
                            <asp:RegularExpressionValidator ID="RegExUpdateStock" ValidationGroup="StockValidation" runat="server" ErrorMessage="The stock level cannot contain alphanumeric characters." ControlToValidate="NewStockTextBox" ValidationExpression="^([1-9]\d*)$|^0$"></asp:RegularExpressionValidator><br />  
                            <asp:RequiredFieldValidator ID="RequiredFieldUpdateStock" runat="server" ValidationGroup="StockValidation" ErrorMessage="Stock is Required" ControlToValidate="NewStockTextBox"></asp:RequiredFieldValidator><br />
                            
                            <asp:LinkButton ID="UpdateStockLinkButton" runat="server" CausesValidation="true"
                                CommandName="UpdateStock" Text="Update" ValidationGroup="StockValidation"></asp:LinkButton>
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
                            <asp:RegularExpressionValidator ID="RegExUpdatePrice" ValidationGroup="PriceValidation" runat="server" ErrorMessage="The price cannot contain alphanumeric characters." ControlToValidate="NewPriceTextBox" ValidationExpression="^([1-9]\d*)$|^0$"></asp:RegularExpressionValidator><br />  
                            <asp:RequiredFieldValidator ID="RequiredFieldUpdatePrice" runat="server" ValidationGroup="PriceValidation" ErrorMessage="Price is Required" ControlToValidate="NewPriceTextBox"></asp:RequiredFieldValidator><br />
                            
                            
                            <asp:LinkButton ID="UpdatePriceLinkButton" runat="server" CausesValidation="true"
                                CommandName="UpdatePrice" Text="Update" ValidationGroup="PriceValidation"></asp:LinkButton>
                            <asp:LinkButton ID="CancelPriceUpdateLinkButton" runat="server" CausesValidation="false"
                                CommandName="CancelPriceUpdate" Text="Cancel"></asp:LinkButton>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

