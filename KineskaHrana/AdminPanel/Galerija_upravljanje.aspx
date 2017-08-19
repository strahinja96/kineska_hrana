<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Galerija_upravljanje.aspx.cs" Inherits="KineskaHrana.AdminPanel.Galerija_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje slikama u galeriji</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje slikama u galeriji</h1>
    <form id="formGalerija" runat="server">
        <div class="adminBox">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idSlike" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="Id Slike" InsertVisible="False" SortExpression="idSlike">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("idSlike") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("idSlike") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="linkUnesi" runat="server" ValidationGroup="grupaUnesi" OnClick="linkUnesi_Click">Unesi</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ime slike" SortExpression="ime_slike">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ime_slike") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Ime slike je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Ime slike nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ime_slike") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbImeSlike" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTextBox11" ValidationGroup="grupaUnesi" runat="server" ControlToValidate="tbImeSlike" EnableClientScript="False" ErrorMessage="Ime slike je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ValidationGroup="grupaUnesi" runat="server" ControlToValidate="tbImeSlike" EnableClientScript="False" ErrorMessage="Ime slike nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Putanja slike" SortExpression="putanja_slike">
                        <EditItemTemplate>
                            <asp:Label ID="LabelPutanja" runat="server" Text='<%# Bind("putanja_slike") %>'></asp:Label>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:CustomValidator ID="CustomValidatorUpdate" runat="server" Text="!" ForeColor="Red" ErrorMessage="Slika nije u dobrom formatu."></asp:CustomValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("putanja_slike") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:FileUpload ID="fileImg" runat="server" ValidationGroup="insGrp"/>
                            <asp:RequiredFieldValidator ID="reqfileImg" runat="server" ControlToValidate="fileImg" EnableClientScript="False" ErrorMessage="Putanja slike je obavezna." ValidationGroup="grupaUnesi" Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Text="!" ForeColor="Red" ErrorMessage="Slika nije u dobrom formatu."></asp:CustomValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Putanja thumbnail" SortExpression="putanja_thumbnail">
                        <EditItemTemplate>
                            <asp:Label ID="LabelUploadThumb" runat="server" Text='<%# Bind("putanja_thumbnail") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("putanja_thumbnail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Galerija] WHERE [idSlike] = @idSlike" InsertCommand="INSERT INTO [Galerija] ([ime_slike], [putanja_slike], [putanja_thumbnail]) VALUES (@ime_slike, @putanja_slike, @putanja_thumbnail)" SelectCommand="SELECT * FROM [Galerija]" UpdateCommand="UPDATE [Galerija] SET [ime_slike] = @ime_slike, [putanja_slike] = @putanja_slike, [putanja_thumbnail] = @putanja_thumbnail WHERE [idSlike] = @idSlike">
                <DeleteParameters>
                    <asp:Parameter Name="idSlike" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ime_slike" Type="String" />
                    <asp:Parameter Name="putanja_slike" Type="String" />
                    <asp:Parameter Name="putanja_thumbnail" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ime_slike" Type="String" />
                    <asp:Parameter Name="putanja_slike" Type="String" />
                    <asp:Parameter Name="putanja_thumbnail" Type="String" />
                    <asp:Parameter Name="idSlike" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="grupaUnesi"/>
        <asp:Label ID="ErrorsLabel" ForeColor="Red" runat="server" Text=""></asp:Label>
    </form>
</asp:Content>
