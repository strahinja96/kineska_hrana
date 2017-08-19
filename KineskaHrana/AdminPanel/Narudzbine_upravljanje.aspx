<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Narudzbine_upravljanje.aspx.cs" Inherits="KineskaHrana.AdminPanel.Narudzbine_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje narudzbinama</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje narudzbinama</h1>
    <form id="formNarudzbine" runat="server">
            <div class="adminBox">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idNarudzbina" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id Narudzbina" InsertVisible="False" SortExpression="idNarudzbina">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idNarudzbina") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idNarudzbina") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id Korisnik" SortExpression="idKorisnik">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("idKorisnik") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("idKorisnik") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id Jelo" SortExpression="idJelo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataValueField="idJelo" DataTextField="nazivJelo" SelectedValue='<%# Bind("idJelo") %>' onChange="promeniCenu(this)"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList12" runat="server" DataSourceID="SqlDataSource2" DataValueField="idJelo" DataTextField="nazivJelo" SelectedValue='<%# Bind("idJelo") %>'></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Vreme" SortExpression="vreme">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("vreme") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Vreme je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Vreme nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[0123]{1}[0-9]{1}-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept|Oct|Nov|Dec)-[01]{1}[0-9]{1}\s[012]{1}[0-9]{1}:[012345]{1}[0-9]{1}:[012345]{1}[0-9]{1}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("vreme") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cena" SortExpression="cena">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxCena" runat="server" Text='<%# Bind("cena") %>' Enabled="false"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("cena") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ime" SortExpression="ime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ime") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req12" runat="server" ControlToValidate="TextBox5" EnableClientScript="False" ErrorMessage="Ime je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev12" runat="server" ControlToValidate="TextBox5" EnableClientScript="False" ErrorMessage="Ime nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,10}){1}(\s[A-Z]{1}[a-z]{1,10})*$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prezime" SortExpression="prezime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("prezime") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req123" runat="server" ControlToValidate="TextBox6" EnableClientScript="False" ErrorMessage="Prezime je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev123" runat="server" ControlToValidate="TextBox6" EnableClientScript="False" ErrorMessage="Prezime nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,10}){1}(\s[A-Z]{1}[a-z]{1,10})*$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("prezime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Adresa" SortExpression="adresa">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("adresa") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1233" runat="server" ControlToValidate="TextBox7" EnableClientScript="False" ErrorMessage="Adresa je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1233" runat="server" ControlToValidate="TextBox7" EnableClientScript="False" ErrorMessage="Adresa nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("adresa") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Narudzbine] WHERE [idNarudzbina] = @idNarudzbina" InsertCommand="INSERT INTO [Narudzbine] ([idKorisnik], [idJelo], [vreme], [cena], [ime], [prezime], [adresa]) VALUES (@idKorisnik, @idJelo, @vreme, @cena, @ime, @prezime, @adresa)" SelectCommand="SELECT * FROM [Narudzbine]" UpdateCommand="UPDATE [Narudzbine] SET [idKorisnik] = @idKorisnik, [idJelo] = @idJelo, [vreme] = @vreme, [cena] = @cena, [ime] = @ime, [prezime] = @prezime, [adresa] = @adresa WHERE [idNarudzbina] = @idNarudzbina">
            <DeleteParameters>
                <asp:Parameter Name="idNarudzbina" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idKorisnik" Type="Int32" />
                <asp:Parameter Name="idJelo" Type="Int32" />
                <asp:Parameter Name="vreme" Type="DateTime" />
                <asp:Parameter Name="cena" Type="Decimal" />
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="adresa" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="idKorisnik" Type="Int32" />
                <asp:Parameter Name="idJelo" Type="Int32" />
                <asp:Parameter Name="vreme" Type="DateTime" />
                <asp:Parameter Name="cena" Type="Decimal" />
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="adresa" Type="String" />
                <asp:Parameter Name="idNarudzbina" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [nazivJelo], [idJelo] FROM [Jela]"></asp:SqlDataSource>
    </form>
</asp:Content>
