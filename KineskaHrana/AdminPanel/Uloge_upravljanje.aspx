<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Uloge_upravljanje.aspx.cs" Inherits="KineskaHrana.AdminPanel.Uloge_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje ulogama</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje ulogama</h1>
    <form id="formUloge" runat="server">
            <div class="adminBox">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idUloga" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id Uloge" InsertVisible="False" SortExpression="idUloga">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idUloga") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idUloga") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="linkUnesi" runat="server" ValidationGroup="unesiGrupa" OnClick="linkUnesi_Click">Unesi</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Naziv uloge" SortExpression="nazivUloga">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nazivUloga") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Naziv uloge je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Naziv uloge nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("nazivUloga") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbNazivUloga" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req12" runat="server" ControlToValidate="tbNazivUloga" EnableClientScript="False" ErrorMessage="Naziv uloge je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="unesiGrupa"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev12" runat="server" ControlToValidate="tbNazivUloga" EnableClientScript="False" ErrorMessage="Naziv uloge nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$" ValidationGroup="unesiGrupa"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Uloge] WHERE [idUloga] = @idUloga" InsertCommand="INSERT INTO [Uloge] ([nazivUloga]) VALUES (@nazivUloga)" SelectCommand="SELECT * FROM [Uloge]" UpdateCommand="UPDATE [Uloge] SET [nazivUloga] = @nazivUloga WHERE [idUloga] = @idUloga">
            <DeleteParameters>
                <asp:Parameter Name="idUloga" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nazivUloga" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nazivUloga" Type="String" />
                <asp:Parameter Name="idUloga" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="unesiGrupa"/>
    </div>
    </form>
</asp:Content>
