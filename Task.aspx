<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Task.aspx.cs" Inherits="Task" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 232px;
        }
        .style3
        {
            width: 71px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    
        <br />
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td class="style3">
    
        <asp:FileUpload ID="FileUpload1" runat="server" Width="216px" />
                </td>
                <td class="style2">
    
        <asp:Button ID="btn_Upload" runat="server" Font-Names="Tahoma" 
            Text="Upload" onclick="btn_Upload_Click" />
    
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Button ID="btn_Show" runat="server" Text="Show" onclick="btn_Show_Click" />
                </td>
                <td class="style2">
    
        <asp:Repeater  ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table  id="Table1" runat="server" width="800">
                            <tr id="Tr1" runat="server" width="800">
                                <td id="Td1" runat="server" width="800">
                                    <table style="background-color: #FFFFFF;
                                            border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                                            font-family: Verdana, Arial, Helvetica, sans-serif; width:800;" border="1" id="itemPlaceholderContainer" runat="server" width="800">
                                        <tr style="color: #000000; background-color: #dcdcdc;" id="Tr2" runat="server" width="800">
                                            <th id="Th1" runat="server"  width="800">
                                                Task Name
                                            </th>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr style="background-color: #DCDCDC; color: #000000;">
                                <td>
                                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </td>
                                <%--<td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("CreateDate") %>' />
                    </td>--%>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
    
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Button ID="btnInsert" runat="server" Text="Insert To DB" 
                        onclick="btnInsert_Click" />
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
