<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DemoRequest.aspx.cs" Inherits="DemoRequest" %>

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
            width: 56px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    Project:</td>
                <td>
                    <asp:DropDownList ID="drpProject" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="ProjName" DataValueField="ProjID" Height="16px" Width="159px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Year:</td>
                <td>
                    <asp:TextBox ID="txtYear" runat="server" Width="156px">2012</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Season:</td>
                <td>
                    <asp:DropDownList ID="drpQ" runat="server">
                        <asp:ListItem Value="1">Jan</asp:ListItem>
                        <asp:ListItem Value="2">April</asp:ListItem>
                        <asp:ListItem Value="3">July</asp:ListItem>
                        <asp:ListItem Value="4">October</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MyDBConnectionString %>" 
                        SelectCommand="SELECT * FROM [tblProject]"></asp:SqlDataSource>
                    <asp:LinkButton ID="btnGo" runat="server" onclick="btnGo_Click">Show Guntt Chart</asp:LinkButton>
                </td>
            </tr>
        </table>
  
    </div>
    </form>
</body>
</html>
