<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Anketa.aspx.cs" Inherits="KineskaHrana.Anketa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Anketa</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="tekstCentar">Anketa</h1>
    <div class="container70 centerDiv" id="divAnketaTabela">
    <table class="tableMain" id="anketaTabela" runat="server">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Naslov ankete"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="odgovor" DataValueField="idOdgovor">
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idOdgovor], [odgovor] FROM [Odgovori] WHERE ([idAnketa] = @idAnketa)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label2" DefaultValue="1" Name="idAnketa" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnGlasaj" runat="server" Text="Glasaj" />
            </td>
        </tr>
    </table>
    </div>
    <div class="container100 tekstCentar centerDiv">
        <h3 id="anketaPoruka" class="zelenaSlova"></h3>
    </div>
        <div class="container100 centerDiv">
        <h3 id="anketaGreska" class="crvenaSlova tekstCentar" runat="server"></h3>
    </div>
    </form>
</asp:Content>
