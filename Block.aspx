<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Block.aspx.cs" Inherits="Block" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit"  tagprefix="ajaxtoolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
        <style type="text/css">

        .style1
        {
            width: 100%;
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
        .style2
        {
            width: 122px;
        }
        .style5
        {
            width: 122px;
            height: 27px;
        }
        .style6
        {
            height: 27px;
        }
        </style>

</head>
<body>
    <form id="form1" runat="server">
      
    <ajaxtoolkit:toolkitscriptmanager   EnableViewState="true"  ID="ScriptManager1" runat="server">
</ajaxtoolkit:toolkitscriptmanager>
        <table class="style1">
            <tr>
                <td class="style5">
                    Project Name:</td>
                <td class="style6">
            <asp:DropDownList ID="ddListProject"  runat="server" Width="170" />
                            <br />
         
 
                </td>
                <td class="style6">
                    </td>
            </tr>
            <tr>
                <td class="style3">
                    Group Name:</td>
                <td class="style4">
    <asp:DropDownList ID="ddListGroup"  runat="server"  Width="170" style="margin-bottom: 6px" />
                    
  </td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    Block&nbsp; Name:</td>
                <td>
<asp:TextBox ID="txtBlock"  runat="server" Height="21px" 
            Width="142px"></asp:TextBox>


  
                        </td>
                

<ajaxtoolkit:autocompleteextender ID="txtBlock_AutoCompleteExtender" runat="server"
  EnableCaching="true"
  BehaviorID="AutoCompleteEx"
  MinimumPrefixLength="2"
  TargetControlID="txtBlock"
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
                    Start Date:</td>
                <td>
<asp:TextBox ID="txtStartDate" runat="server" TabIndex="14"></asp:TextBox></td>
     </td>
                <td>
                    
                        </td>
            </tr>
            <tr>
                <td class="style2">
                    End Date: </td>
                <td>
                    <asp:TextBox ID="txtEndDate" runat="server" TabIndex="14"></asp:TextBox></td>
                <td>
    <ajaxToolkit:CascadingDropDown ID="CascadingDropDown1" runat="server" TargetControlID="ddListProject"
             Category="Project"  PromptText="Please select a Project"  LoadingText="[Loading Project...]"
            ServicePath="Cascading.asmx" ServiceMethod="GetProjects" ></ajaxToolkit:CascadingDropDown>
            
    <ajaxToolkit:CascadingDropDown ID="CascadingDropDown2" runat="server" TargetControlID="ddListGroup"
            Category="Group" PromptText="Please select a Group" LoadingText="[Loading Group...]"
         servicePath="Cascading.asmx" ServiceMethod="GetGroups" ParentControlID="ddListProject" ></ajaxToolkit:CascadingDropDown>
         
 
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="btn_Save" runat="server" Text="Save" onclick="btn_Save_Click" />
                    </td>
                <td>
                    

                  
                    
                  
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MyDBConnectionString %>" 
                        SelectCommand="SELECT * FROM [tblProject]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
<ajaxtoolkit:calendarextender ID="CalendarStartDate" runat="server" TargetControlID="txtStartDate"></ajaxtoolkit:calendarextender>
                

                </td>
                <td>
<ajaxtoolkit:calendarextender ID="CalendarEndDate" runat="server" TargetControlID="txtEndDate"></ajaxtoolkit:calendarextender>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
