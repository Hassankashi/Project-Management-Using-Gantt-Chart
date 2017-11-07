<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style5
        {
            height: 43px;
        }
        .style3
        {
            height: 45px;
        }
        .style4
        {
            height: 42px;
        }
        .style2
        {
            height: 39px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div>
            <table class="style1">
                <tr>
                    <td class="style5">
                        <asp:HyperLink ID="hplnkTask" runat="server" NavigateUrl="~/Task.aspx" 
                            Target="_self">Insert Task To Data Base</asp:HyperLink>
                    </td>
                    <td class="style5">
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:HyperLink ID="hplnkGroup" runat="server" NavigateUrl="~/Group.aspx" 
                            Target="_self">Define Group</asp:HyperLink>
                    </td>
                    <td class="style3">
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:HyperLink ID="hplnkBlock" runat="server" NavigateUrl="~/Block.aspx" 
                            Target="_self">Define Block</asp:HyperLink>
                    </td>
                    <td class="style4">
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:HyperLink ID="hplnkRequestDemo" runat="server" 
                            NavigateUrl="~/DemoRequest.aspx" Target="_self">Request Demo</asp:HyperLink>
                    </td>
                    <td class="style2">
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
