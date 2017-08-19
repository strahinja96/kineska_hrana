<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Korisnici_upravljanje.aspx.cs" Inherits="KineskaHrana.AdminPanel.Korisnici_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje korisnicima</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje korisnicima</h1>
    <form id="formKorisnici" runat="server">
            <div class="adminBox">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idKorisnik" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id Korisnik" InsertVisible="False" SortExpression="idKorisnik">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idKorisnik") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idKorisnik") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Username" SortExpression="username">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Username je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Username nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[A-Za-z0-9]{3,15}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password" SortExpression="password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req12" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Password je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev12" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Password nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[A-Za-z0-9-!\+\.\,_-]{3,20}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Id Uloga" SortExpression="idUloga">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataValueField="idUloga" DataTextField="nazivUloga" SelectedValue='<%# Bind("idUloga") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList12" runat="server" DataSourceID="SqlDataSource2" Enabled="false" DataValueField="idUloga" DataTextField="nazivUloga" SelectedValue='<%# Bind("idUloga") %>'></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req123" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Email je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev123" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Email nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Korisnici] WHERE [idKorisnik] = @idKorisnik" InsertCommand="INSERT INTO [Korisnici] ([username], [password], [idUloga], [email]) VALUES (@username, @password, @idUloga, @email)" SelectCommand="SELECT * FROM [Korisnici]" UpdateCommand="UPDATE [Korisnici] SET [username] = @username, [password] = @password, [idUloga] = @idUloga, [email] = @email WHERE [idKorisnik] = @idKorisnik">
            <DeleteParameters>
                <asp:Parameter Name="idKorisnik" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="idUloga" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="idUloga" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="idKorisnik" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Uloge]"></asp:SqlDataSource>
    </form>
</asp:Content>
