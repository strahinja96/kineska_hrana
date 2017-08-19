<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Meni_upravljanje.aspx.cs" Inherits="KineskaHrana.AdminPanel.Meni_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje menijima</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje menijima</h1>
    <form id="formMeni" runat="server">
            <div class="adminBox">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idMeni" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id Meni" InsertVisible="False" SortExpression="idMeni">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idMeni") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idMeni") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="linkUnesi" runat="server" ValidationGroup="grupaUnos" OnClick="linkUnesi_Click">Unesi</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Naziv meni" SortExpression="naziv_meni">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("naziv_meni") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Naziv menija je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Naziv menija nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("naziv_meni") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbNaziv" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req12" runat="server" ControlToValidate="tbNaziv" EnableClientScript="False" ErrorMessage="Naziv menija je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="grupaUnos"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev12" runat="server" ControlToValidate="tbNaziv" EnableClientScript="False" ErrorMessage="Naziv menija nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$" ValidationGroup="grupaUnos"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Link meni" SortExpression="link_meni">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("link_meni") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req123" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Link menija je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev123" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Link menija nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("link_meni") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbLink" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1233" runat="server" ControlToValidate="tbLink" EnableClientScript="False" ErrorMessage="Link menija je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="grupaUnos"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1233" runat="server" ControlToValidate="tbLink" EnableClientScript="False" ErrorMessage="Link menija nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$" ValidationGroup="grupaUnos"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prioritet meni" SortExpression="prioritet_meni">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("prioritet_meni") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req12334" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Prioritet menija je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev12334" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Prioritet menija nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("prioritet_meni") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbPrioritet" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req123344" runat="server" ControlToValidate="tbPrioritet" EnableClientScript="False" ErrorMessage="Prioritet menija je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="grupaUnos"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev123344" runat="server" ControlToValidate="tbPrioritet" EnableClientScript="False" ErrorMessage="Prioritet menija nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$" ValidationGroup="grupaUnos"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Meni] WHERE [idMeni] = @idMeni" InsertCommand="INSERT INTO [Meni] ([naziv_meni], [link_meni], [prioritet_meni]) VALUES (@naziv_meni, @link_meni, @prioritet_meni)" SelectCommand="SELECT * FROM [Meni]" UpdateCommand="UPDATE [Meni] SET [naziv_meni] = @naziv_meni, [link_meni] = @link_meni, [prioritet_meni] = @prioritet_meni WHERE [idMeni] = @idMeni">
            <DeleteParameters>
                <asp:Parameter Name="idMeni" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="naziv_meni" Type="String" />
                <asp:Parameter Name="link_meni" Type="String" />
                <asp:Parameter Name="prioritet_meni" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="naziv_meni" Type="String" />
                <asp:Parameter Name="link_meni" Type="String" />
                <asp:Parameter Name="prioritet_meni" Type="Int32" />
                <asp:Parameter Name="idMeni" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="grupaUnos"/>
    </form>
</asp:Content>
