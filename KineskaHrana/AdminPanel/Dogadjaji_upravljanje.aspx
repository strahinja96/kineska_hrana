<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dogadjaji_upravljanje.aspx.cs" Inherits="KineskaHrana.AdminPanel.Dogadjaji_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje dogadjajima</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje jelima</h1>
    <form id="formJela" runat="server">
        <div class="adminBox">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idDogadjaj" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="idDogadjaj" HeaderText="Id Dogadjaj" InsertVisible="False" ReadOnly="True" SortExpression="idDogadjaj" />
                    <asp:BoundField DataField="dogadjaj_opis" HeaderText="Dogadjaj opis" SortExpression="dogadjaj_opis" />
                    <asp:BoundField DataField="id_korisnik" HeaderText="Id Korisnik" SortExpression="id_korisnik" />
                    <asp:BoundField DataField="vreme" HeaderText="Vreme" SortExpression="vreme" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Dogadjaji] WHERE [idDogadjaj] = @idDogadjaj" InsertCommand="INSERT INTO [Dogadjaji] ([dogadjaj_opis], [id_korisnik], [vreme]) VALUES (@dogadjaj_opis, @id_korisnik, @vreme)" SelectCommand="SELECT * FROM [Dogadjaji]" UpdateCommand="UPDATE [Dogadjaji] SET [dogadjaj_opis] = @dogadjaj_opis, [id_korisnik] = @id_korisnik, [vreme] = @vreme WHERE [idDogadjaj] = @idDogadjaj">
                <DeleteParameters>
                    <asp:Parameter Name="idDogadjaj" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="dogadjaj_opis" Type="String" />
                    <asp:Parameter Name="id_korisnik" Type="Int32" />
                    <asp:Parameter Name="vreme" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="dogadjaj_opis" Type="String" />
                    <asp:Parameter Name="id_korisnik" Type="Int32" />
                    <asp:Parameter Name="vreme" Type="DateTime" />
                    <asp:Parameter Name="idDogadjaj" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
