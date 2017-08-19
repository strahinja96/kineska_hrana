<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Jela_upravljanje.aspx.cs" Inherits="KineskaHrana.AdminPanel.Jela_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje jelima</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje jelima</h1>
    <form id="formJela" runat="server">
            <div class="adminBox">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idJelo" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id Jelo" SortExpression="idJelo">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idJelo") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idJelo") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="linkUnesi" runat="server" ValidationGroup="grupaUnesi" OnClick="linkUnesi_Click">Unesi</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Naziv jelo" SortExpression="nazivJelo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nazivJelo") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Naziv jela je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Naziv jela nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("nazivJelo") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbNazivJelo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox11" ValidationGroup="grupaUnesi" runat="server" ControlToValidate="tbNazivJelo" EnableClientScript="False" ErrorMessage="Naziv jela je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ValidationGroup="grupaUnesi" runat="server" ControlToValidate="tbNazivJelo" EnableClientScript="False" ErrorMessage="Naziv jela nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cena" SortExpression="cena">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("cena") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox112" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Cena je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator112" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Cena nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("cena") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbCena" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox1122" ValidationGroup="grupaUnesi" runat="server" ControlToValidate="tbCena" EnableClientScript="False" ErrorMessage="Cena je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1122" ValidationGroup="grupaUnesi" runat="server" ControlToValidate="tbCena" EnableClientScript="False" ErrorMessage="Cena nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Slika" SortExpression="slika">
                    <EditItemTemplate>
                        <asp:Label ID="LabelPutanja" runat="server" Text='<%# Bind("slika") %>'></asp:Label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:CustomValidator ID="CustomValidatorUpdate" runat="server" Text="!" ForeColor="Red" ErrorMessage="Slika nije u dobrom formatu."></asp:CustomValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("slika") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                            <asp:FileUpload ID="fileImg" runat="server" ValidationGroup="insGrp"/>
                            <asp:RequiredFieldValidator ID="reqfileImg" runat="server" ControlToValidate="fileImg" EnableClientScript="False" ErrorMessage="Putanja slike je obavezna." ValidationGroup="grupaUnesi" Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Text="!" ForeColor="Red" ErrorMessage="Slika nije u dobrom formatu."></asp:CustomValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Jela] WHERE [idJelo] = @idJelo" InsertCommand="INSERT INTO [Jela] ([nazivJelo], [cena], [slika]) VALUES (@nazivJelo, @cena, @slika)" SelectCommand="SELECT * FROM [Jela]" UpdateCommand="UPDATE [Jela] SET [nazivJelo] = @nazivJelo, [cena] = @cena, [slika] = @slika WHERE [idJelo] = @idJelo">
            <DeleteParameters>
                <asp:Parameter Name="idJelo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idJelo" Type="Int32" />
                <asp:Parameter Name="nazivJelo" Type="String" />
                <asp:Parameter Name="cena" Type="Decimal" />
                <asp:Parameter Name="slika" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nazivJelo" Type="String" />
                <asp:Parameter Name="cena" Type="Decimal" />
                <asp:Parameter Name="slika" Type="String" />
                <asp:Parameter Name="idJelo" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="grupaUnesi"/>
        <asp:Label ID="ErrorsLabel" ForeColor="Red" runat="server" Text=""></asp:Label>
    </form>
</asp:Content>
