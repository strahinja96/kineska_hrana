<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Kontakt_upravljanje.aspx.cs" Inherits="KineskaHrana.AdminPanel.Kontakt_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje kontakt porukama</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje kontaktima</h1>
    <div class="adminBox">
        <form id="formKontakt" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idKontakt" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id Kontakt" InsertVisible="False" SortExpression="idKontakt">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idKontakt") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idKontakt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ime" SortExpression="ime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ime") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Ime je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Ime nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,10}){1}(\s[A-Z]{1}[a-z]{1,10})*$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prezime" SortExpression="prezime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("prezime") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Prezime je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Prezime nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,10}){1}(\s[A-Z]{1}[a-z]{1,10})*$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("prezime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Poruka" SortExpression="poruka">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("poruka") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Poruka je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Poruka nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("poruka") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req4" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Email je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev4" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Email nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Kontakt] WHERE [idKontakt] = @idKontakt" InsertCommand="INSERT INTO [Kontakt] ([ime], [prezime], [poruka], [email]) VALUES (@ime, @prezime, @poruka, @email)" SelectCommand="SELECT * FROM [Kontakt]" UpdateCommand="UPDATE [Kontakt] SET [ime] = @ime, [prezime] = @prezime, [poruka] = @poruka, [email] = @email WHERE [idKontakt] = @idKontakt">
            <DeleteParameters>
                <asp:Parameter Name="idKontakt" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="poruka" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ime" Type="String" />
                <asp:Parameter Name="prezime" Type="String" />
                <asp:Parameter Name="poruka" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="idKontakt" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        </form>
    </div>
</asp:Content>

