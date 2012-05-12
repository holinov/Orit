<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EgrulViewerUserControl.ascx.cs" Inherits="Orit.EgrulViewer.Components.EgrulViewerUserControl, Orit.EgrulViewer.Components, Version=1.0.0.0, Culture=neutral, PublicKeyToken=22d60dabbca5b3e8" %>
<%@ Register assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>
<style type="text/css">
    .infoblock table caption {
        margin-top: 15px;
        font-size: 1.5em;
        font-weight: bold;
    }
</style>

        <table width="100%">
            <tr>
                <th>Тип лица</th>
                <th>Тип выписки</th>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="LType" runat="server">
                        <asp:ListItem Selected="True">Юр. лица</asp:ListItem>
                        <asp:ListItem>Физ. лица</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                 <td>
                    <asp:RadioButtonList ID="RType" runat="server">
                        <asp:ListItem>Короткая</asp:ListItem>
                        <asp:ListItem Selected="True">Длинная</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="ИНН\ОГРН:"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Получить выписку" />                    
                    <asp:Button ID="Button2" runat="server" Text="Сохранить как PDF" Visible="False" />
                </td>
            </tr>
            <caption>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Xml ID="xmlResult" runat="server"></asp:Xml>
                    </td>
                </tr>
            </caption>
        </table>

