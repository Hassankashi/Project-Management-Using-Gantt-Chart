<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Group.aspx.cs" Inherits="Group" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit"
         TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
      <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 122px;
        }
        .style3
        {
            width: 122px;
            height: 33px;
        }
        .style4
        {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div>
    <ajaxtoolkit:toolkitscriptmanager  ID="ScriptManager1" runat="server">
</ajaxtoolkit:toolkitscriptmanager>
        <table class="style1">
            <tr>
                <td class="style3">
                    Project Name:</td>
                <td class="style4">
                    <asp:DropDownList ID="drp_ProjName" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="ProjName" DataValueField="ProjID" 
                        Height="32px" Width="142px">
                    </asp:DropDownList>
 
                </td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    Group Name:</td>
                <td>
<asp:TextBox ID="txtGroup"  runat="server" Height="21px" 
            Width="142px"></asp:TextBox>

<ajaxtoolkit:autocompleteextender ID="txtGroup_AutoCompleteExtender" runat="server"
  EnableCaching="true"
  BehaviorID="AutoCompleteEx"
  MinimumPrefixLength="2"
  TargetControlID="txtGroup"
  ServicePath="GroupAutoComplete.asmx"
  ServiceMethod="GetCompletionList" 
  CompletionInterval="1000"  
  CompletionSetCount="20"
  DelimiterCharacters=";, :"
  ShowOnlyCurrentWordInCompletionListItem="true">
 
  </ajaxtoolkit:autocompleteextender>
  
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Group Color:</td>
                <td>
                    <asp:DropDownList ID="drp_Color" runat="server" TabIndex="9" 
                        Width="144px">
                        <asp:ListItem>Red</asp:ListItem>
                        <asp:ListItem>Blue</asp:ListItem>
                        <asp:ListItem>Yellow</asp:ListItem>
                        <asp:ListItem>Violet</asp:ListItem>
                        <asp:ListItem>Gray</asp:ListItem>
                        <asp:ListItem>Navy</asp:ListItem>
                        <asp:ListItem>Gold</asp:ListItem>
                        <asp:ListItem>Pink</asp:ListItem>
                        <asp:ListItem>LightGreen</asp:ListItem>
                        <asp:ListItem>Green</asp:ListItem>
                        <asp:ListItem>DarkGreen</asp:ListItem>
                        <asp:ListItem>Lime</asp:ListItem>
                        <asp:ListItem>Purple</asp:ListItem>
                        <asp:ListItem>Olive</asp:ListItem>
                        <asp:ListItem>Silver</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btn_Save" runat="server" Text="Save" onclick="btn_Save_Click" />
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MyDBConnectionString %>" 
                        SelectCommand="SELECT * FROM [tblProject]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>


    </div>
    </form>
</body>
</html>
