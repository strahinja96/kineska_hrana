<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Naruci.aspx.cs" Inherits="KineskaHrana.Naruci"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Naruci</title>
    <script type="text/javascript">
        function ValidateCheckBoxList(sender, args) {
            var checkBoxList = document.getElementById("<%=CheckBoxList1.ClientID %>");
            var checkboxes = checkBoxList.getElementsByTagName("input");
            var isValid = false;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isValid = true;
                    break;
                }
            }
            args.IsValid = isValid;
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h3 class="container80 tekstCentar zelenaSlova centerDiv" runat="server" id="uspesnoNaruceno"></h3>
    <h3 class="container80 tekstCentar crvenaSlova centerDiv" runat="server" id="nisteUlogovani">Morate se ulogovati da biste narucili jelo.</h3>
    <table class="tableMain" id="naruciTabela" runat="server">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="&lt;h2&gt;Narucite&lt;/h2&gt;"></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Ime"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbIme" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbIme" EnableClientScript="False" ErrorMessage="Ime je obavezno." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbIme" EnableClientScript="False" ErrorMessage="Ime nije u dobrom formatu." ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,10}){1}(\s[A-Z]{1}[a-z]{1,10})*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Prezime"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbPrezime" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbPrezime" EnableClientScript="False" ErrorMessage="Prezime je obavezno." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbPrezime" EnableClientScript="False" ErrorMessage="Prezime nije u dobrom formatu." ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,10}){1}(\s[A-Z]{1}[a-z]{1,10})*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Adresa"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbAdresa" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbAdresa" EnableClientScript="False" ErrorMessage="Adresa je obavezno polje." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbAdresa" EnableClientScript="False" ErrorMessage="Adresa nije u dobrom formatu." ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Jela"></asp:Label>
            </td>
            <td>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nazivJelo" DataValueField="idJelo">
                </asp:CheckBoxList>
            </td>
            <td>
                <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Morate izabrati bar jedno jelo."
                    ForeColor="Red" ClientValidationFunction="ValidateCheckBoxList" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Naruci" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idJelo], [nazivJelo] FROM [Jela]"></asp:SqlDataSource>
            </td>
            <td></td>
        </tr>
    </table>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" DataSourceID="SqlDataSource2" PageSize="3">
            <Columns>
                <asp:BoundField DataField="nazivJelo" HeaderText="Jelo" SortExpression="nazivJelo" />
                <asp:BoundField DataField="cena" HeaderText="Cena" SortExpression="cena" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [nazivJelo], [cena] FROM [Jela]"></asp:SqlDataSource>
    </form>
</asp:Content>
