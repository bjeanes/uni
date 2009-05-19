<%@ Page AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="The Bike Shop &gt; Register" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
            <div class="contentbox-title-shading bg-yellow07 box-on">
                &nbsp;</div>
            <div class="contentbox-title-shading">
                Registration</div>
            <div class="contentbox-noshading">
                <p>If you are new to the site you can register an account by filling in the details below.
                Registered customers can purchase products from our online store. Each customer has a personalised
                profile where they can view their order history and current order status.</p>
                    
            </div>
        </div>
    <div id="RegisterDiv" runat="Server" class="contentbox-container-full">
        <table border="0" style="position: relative">
            <tr>
                <td align="center" colspan="2">
                    Register Your New Account</td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="UserName" runat="server" MaxLength="20" style="left: 0px; top: 16px" ValidationGroup="RegisterValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="20" style="left: 0px; top: 16px" ValidationGroup="RegisterValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" MaxLength="20" style="left: 0px; top: 16px" ValidationGroup="RegisterValidation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                        ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                        ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="FirstName">First Name:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="FirstName" runat="server" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstName"
                        ErrorMessage="First Name is required." ToolTip="First Name is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label2" runat="server" AssociatedControlID="LastName">Last Name:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="LastName" runat="server" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastName"
                        ErrorMessage="Last Name is required." ToolTip="Last Name is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label3" runat="server" AssociatedControlID="Address">Address:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="Address" runat="server" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Address"
                        ErrorMessage="Address is required." ToolTip="Address is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label5" runat="server" AssociatedControlID="City">City:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="City" runat="server" MaxLength="20" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="City"
                        ErrorMessage="City is required." ToolTip="City is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label7" runat="server" AssociatedControlID="State">State:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="State" runat="server" MaxLength="20" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="State"
                        ErrorMessage="City is required." ToolTip="City is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="height: 26px">
                    <asp:Label ID="Label6" runat="server" AssociatedControlID="Country">Country:</asp:Label></td>
                <td style="width: 177px; height: 26px">
                    <asp:TextBox ID="Country" runat="server" MaxLength="20" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Country"
                        ErrorMessage="Country is required." ToolTip="Country is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label4" runat="server" AssociatedControlID="PostCode">Post Code:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="PostCode" runat="server" Width="51px" MaxLength="20" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PostCode"
                        ErrorMessage="Post Code is required." ToolTip="Post Code is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" style="height: 26px">
                    <asp:Label ID="Label8" runat="server" AssociatedControlID="PhoneNumber">Phone Number:</asp:Label></td>
                <td style="height: 26px; width: 177px;">
                    <asp:TextBox ID="PhoneNumber" runat="server" MaxLength="20" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="PhoneNumber"
                        ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></td>
                <td style="width: 177px">
                    <asp:TextBox ID="Email" runat="server" MaxLength="20" ValidationGroup="RegisterValidation" style="left: 0px; top: 16px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                        ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="RegisterValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label>
                    <asp:LinkButton ID="RegisterLinkButton" runat="server" CausesValidation="true" CommandName="RegisterUser"
                        Text="Register" ValidationGroup="RegisterValidation"></asp:LinkButton>
                    <asp:LinkButton ID="Cancel" runat="server" CommandName="CancelRegister" Text="Cancel"></asp:LinkButton><br />
                    
                    
                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal><br />
                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                        ValidationGroup="RegisterValidation" style="z-index: 102; left: 2px; position: relative; top: -12px"></asp:CompareValidator>
                    <br />
                    <br />
                   <div>
                   <asp:RegularExpressionValidator ID="RegExFirstName" runat="server" ErrorMessage="Your first name cannot contain numbers."
                        Style="z-index: 100; left: 3px; position: relative; top: -26px" ControlToValidate="FirstName" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="RegisterValidation"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegExCity" runat="server" ControlToValidate="City"
                        ErrorMessage="Your city cannot contain numbers." Height="1px" Style="z-index: 103;
                        left: 86px; position: absolute; top: 444px" ValidationExpression="^[a-zA-Z]+$"
                        ValidationGroup="RegisterValidation" Width="159px"></asp:RegularExpressionValidator><br />
                    <asp:RegularExpressionValidator ID="RegExPhone" runat="server" ControlToValidate="PhoneNumber"
                        ErrorMessage="Your phone number cannot contain alphanumeric characters." Height="6px"
                        Style="z-index: 109; left: 27px; position: relative; top: 494px" ValidationExpression="^([1-9]\d*)$|^0$"
                        ValidationGroup="RegisterValidation" Width="318px">
                    </asp:RegularExpressionValidator><br />
                    <asp:RegularExpressionValidator ID="RedExLastName" runat="server" ControlToValidate="LastName"
                        ErrorMessage="Your last name cannot contain numbers." Style="z-index: 104; left: 2px;
                        position: relative; top: -56px" ValidationGroup="RegisterValidation" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator><br />
                    <asp:RegularExpressionValidator ID="RegExState" runat="server" ControlToValidate="State"
                        ErrorMessage="Your state cannot contain numbers." Height="1px" Style="z-index: 105;
                        left: 263px; position: relative; top: 390px" ValidationExpression="^[a-zA-Z]+$"
                        ValidationGroup="RegisterValidation" Width="185px"></asp:RegularExpressionValidator><br />
                    <br />
                    <asp:RegularExpressionValidator ID="RegExCountry" runat="server" ControlToValidate="Country"
                        ErrorMessage="Your country cannot contain numbers." Style="z-index: 106; left: 3px;
                        position: relative; top: -55px" ValidationGroup="RegisterValidation" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator><br />
                    <asp:RegularExpressionValidator ID="RegExPostcode" runat="server" ControlToValidate="PostCode"
                        ErrorMessage="Your post code cannot contain alphanumeric characters." Style="z-index: 110;
                        left: 33px; position: absolute; top: 499px" ValidationExpression="^([1-9]\d*)$|^0$"
                        ValidationGroup="RegisterValidation" Width="265px"></asp:RegularExpressionValidator><br />
                       &nbsp;
                    <asp:RegularExpressionValidator ID="RegExState1" runat="server" ControlToValidate="State"
                        ErrorMessage="Your state cannot contain numbers." Style="z-index: 108; left: 0px;
                        position: relative; top: -106px" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="RegisterValidation"></asp:RegularExpressionValidator><br />
                    <asp:RegularExpressionValidator ID="RegExPhone1" runat="server" ControlToValidate="PhoneNumber"
                        ErrorMessage="Your phone number cannot contain alphanumeric characters." Style="z-index: 110;
                        left: 30px; position: relative; top: 523px" ValidationExpression="^([1-9]\d*)$|^0$"
                        ValidationGroup="RegisterValidation" Width="265px"></asp:RegularExpressionValidator><br />
                    <asp:RegularExpressionValidator ID="EmailRegEx" runat="server" ControlToValidate="Email"
                        ErrorMessage="RegularExpressionValidator" ValidationExpression=".+@.+"
                        ValidationGroup="RegisterValidation" style="z-index: 101; left: 3px; position: relative; top: -100px">Email needs to be of the form name@domain.com</asp:RegularExpressionValidator><br />
                    </div></td>
            </tr>
        </table>
    </div>
</asp:Content>
