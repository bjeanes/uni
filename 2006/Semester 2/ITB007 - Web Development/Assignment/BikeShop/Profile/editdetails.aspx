<%@ Page AutoEventWireup="false" CodeFile="editdetails.aspx.vb" Inherits="editdetails"
    Language="VB" MasterPageFile="~/MasterPage.master" Title="The Bike Shop &gt; Profile &gt; Edit Details" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="contentMainPlaceHolder">
    <div class="contentbox-container-full">
        <div class="contentbox-title-shading bg-red07 box-on">
            &nbsp;</div>
        <div class="contentbox-title-shading">
            Edit Profile Details</div>
        <br />
        <asp:HyperLink ID="EditDetailsHyperLink" runat="server" NavigateUrl="~/Profile/editdetails.aspx?TaskID=1"
            Text="Edit Details"></asp:HyperLink><br />
        <asp:HyperLink ID="ChangePasswordHyperLink" runat="server" NavigateUrl="~/Profile/editdetails.aspx?TaskID=2"
            Text="Change Password"></asp:HyperLink><br />
        <asp:HyperLink ID="ReturnHyperlink" runat="server" NavigateUrl="~/profile.aspx" Text="Return to Profile"></asp:HyperLink></div>
    <div id="EditDetailsDiv" runat="server" class="contentbox-container-full">
        <table>
            <tr>
                <td>
                    Username:</td>
                <td>
                    <asp:Label ID="UsernameLabel" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    First Name:</td>
                <td>
                    <asp:TextBox ID="txtboxFirstName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Last Name:</td>
                <td>
                    <asp:TextBox ID="txtboxLastName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Address:</td>
                <td>
                    <asp:TextBox ID="txtboxAddress" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    City:</td>
                <td>
                    <asp:TextBox ID="txtboxCity" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    State:</td>
                <td>
                    <asp:TextBox ID="txtboxState" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Country:</td>
                <td>
                    <asp:TextBox ID="txtboxCountry" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Post Code:</td>
                <td>
                    <asp:TextBox ID="txtboxPostCode" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Phone Number:</td>
                <td>
                    <asp:TextBox ID="txtboxPhoneNumber" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    Email:</td>
                <td>
                    <asp:TextBox ID="txtboxEmail" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <asp:LinkButton ID="UpdateDetailsLinkButton" runat="server" CommandName="Update">Update</asp:LinkButton>
        <asp:LinkButton ID="CancelUpdateLinkButton" runat="server" CausesValidation="False">Cancel</asp:LinkButton></div>
    <div id="ChangePasswordDiv" runat="server" class="contentbox-container-full">
        <table>
            <tr>
                <td colspan="2">
                    Please enter your new password</td>
            </tr>
            <tr>
                <td>
                    New Password:</td>
                <td>
                    <asp:TextBox ID="txtboxNewPassword" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                        ID="NewPasswordRequiredField" runat="server" ControlToValidate="txtboxNewPassword"
                        Display="Dynamic" ErrorMessage="RequiredFieldValidator" Font-Bold="false" Text="*"
                        ValidationGroup="NewPasswordValidation"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    Confirm New Password:</td>
                <td>
                    <asp:TextBox ID="txtboxConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                        ID="ConfirmPasswordRequiredField" runat="server" ControlToValidate="txtboxConfirmNewPassword"
                        Display="Dynamic" ErrorMessage="RequiredFieldValidator" Font-Bold="false" Text="*"
                        ValidationGroup="NewPasswordValidation"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    Please enter your current password to finalise change</td>
            </tr>
            <tr>
                <td>
                    Current Password:</td>
                <td>
                    <asp:TextBox ID="txtboxCurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CurrentPasswordRequiredField" runat="server" ControlToValidate="txtboxCurrentPassword"
                        Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="NewPasswordValidation">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    &nbsp;<asp:Button ID="btnChangePasswordSubmit" runat="server" Text="Submit" ValidationGroup="NewPasswordValidation" /><asp:Button
                        ID="btnCancelChangePassword" runat="server" Text="Cancel" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
