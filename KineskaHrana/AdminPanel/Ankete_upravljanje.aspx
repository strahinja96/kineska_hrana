<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Ankete_upravljanje.aspx.cs" Inherits="KineskaHrana.Admin_Panel.Ankete_upravljanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upravljanje anketama</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="tekstCentar">Upravljanje anketama</h1>
    <form id="formAnkete" runat="server">
        <div class="adminBox">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idAnketa" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id Ankete" InsertVisible="False" SortExpression="idAnketa">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idAnketa") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idAnketa") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="linkUnesi" runat="server" ValidationGroup="unosGrupa" OnClick="linkUnesi_Click">Unesi</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pitanje" SortExpression="pitanje">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("pitanje") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Pitanje je obavezno polje." Text="!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Pitanje nije u dobrom formatu." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("pitanje") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="unesiPitanje" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="req1footer" runat="server" ControlToValidate="unesiPitanje" EnableClientScript="False" ErrorMessage="Pitanje je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="unosGrupa"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1footer" runat="server" ControlToValidate="unesiPitanje" EnableClientScript="False" ErrorMessage="Pitanje nije u dobrom formatu." Text="*" ForeColor="Red" ValidationGroup="unosGrupa" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Anketa Aktivna" SortExpression="aktivna">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("aktivna") %>'>
                            <asp:ListItem Value="1">Da</asp:ListItem>
                            <asp:ListItem Value="0">Ne</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("aktivna") %>' Enabled="false">
                            <asp:ListItem Value="1">Da</asp:ListItem>
                            <asp:ListItem Value="0">Ne</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem Value="-1" Selected>Izaberi...</asp:ListItem>
                            <asp:ListItem Value="1">Da</asp:ListItem>
                            <asp:ListItem Value="0">Ne</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="req2footer" runat="server" ControlToValidate="DropDownList3" EnableClientScript="False" ErrorMessage="Morate izabrati vrednost za polje 'Aktivna anketa'." Text="!" ForeColor="Red" ValidationGroup="unosGrupa" InitialValue="-1"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Ankete] WHERE [idAnketa] = @idAnketa" InsertCommand="INSERT INTO [Ankete] ([pitanje], [aktivna]) VALUES (@pitanje, @aktivna)" SelectCommand="SELECT * FROM [Ankete]" UpdateCommand="UPDATE [Ankete] SET [pitanje] = @pitanje, [aktivna] = @aktivna WHERE [idAnketa] = @idAnketa">
            <DeleteParameters>
                <asp:Parameter Name="idAnketa" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pitanje" Type="String" />
                <asp:Parameter Name="aktivna" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="pitanje" Type="String" />
                <asp:Parameter Name="aktivna" Type="Int32" />
                <asp:Parameter Name="idAnketa" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="unosGrupa"/>
        <br /><br />







            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="idOdgovor" DataSourceID="SqlDataSource2" ShowFooter="True" OnRowDeleting="GridView2_RowDeleting" OnRowUpdating="GridView2_RowUpdating">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="unosGrupa2" />
                    <asp:TemplateField HeaderText="Id Odgovora" InsertVisible="False" SortExpression="idOdgovor">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("idOdgovor") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("idOdgovor") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="linkUnesiOdgovor" runat="server" ValidationGroup="unosGrupa3" OnClick="linkUnesiOdgovor_Click">Unesi</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Odgovor" SortExpression="odgovor">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("odgovor") %>' TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Odgovor je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="unosGrupa2"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Odgovor nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$" ValidationGroup="unosGrupa2"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("odgovor") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbOdgovor" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req1tbOdgovor" runat="server" ControlToValidate="tbOdgovor" EnableClientScript="False" ErrorMessage="Odgovor je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="unosGrupa3"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev1tbOdgovor" runat="server" ControlToValidate="tbOdgovor" EnableClientScript="False" ErrorMessage="Odgovor nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$" ValidationGroup="unosGrupa3"></asp:RegularExpressionValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Anketa" SortExpression="idAnketa">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="pitanje" DataValueField="idAnketa" SelectedValue='<%# Bind("idAnketa") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("idAnketa") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="pitanje" DataValueField="idAnketa">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>       
                    <asp:TemplateField HeaderText="Broj glasova" SortExpression="brojGlasova">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("brojGlasova") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Broj glasova je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="unosGrupa2"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Broj glasova nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$" ValidationGroup="unosGrupa2"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("brojGlasova") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbBrojGlasova" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req3tbBrojGlasova" runat="server" ControlToValidate="tbBrojGlasova" EnableClientScript="False" ErrorMessage="Broj glasova je obavezno polje." Text="!" ForeColor="Red" ValidationGroup="unosGrupa3"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev3tbBrojGlasova" runat="server" ControlToValidate="tbBrojGlasova" EnableClientScript="False" ErrorMessage="Broj glasova nije u dobrom formatu." Text="!" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$" ValidationGroup="unosGrupa3"></asp:RegularExpressionValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>







            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Odgovori] WHERE [idOdgovor] = @idOdgovor" InsertCommand="INSERT INTO [Odgovori] ([odgovor], [idAnketa], [brojGlasova]) VALUES (@odgovor, @idAnketa, @brojGlasova)" SelectCommand="SELECT * FROM [Odgovori]" UpdateCommand="UPDATE [Odgovori] SET [odgovor] = @odgovor, [idAnketa] = @idAnketa, [brojGlasova] = @brojGlasova WHERE [idOdgovor] = @idOdgovor">
                <DeleteParameters>
                    <asp:Parameter Name="idOdgovor" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="odgovor" Type="String" />
                    <asp:Parameter Name="idAnketa" Type="Int32" />
                    <asp:Parameter Name="brojGlasova" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="odgovor" Type="String" />
                    <asp:Parameter Name="idAnketa" Type="Int32" />
                    <asp:Parameter Name="brojGlasova" Type="Int32" />
                    <asp:Parameter Name="idOdgovor" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" ForeColor="Red"/>
            <asp:ValidationSummary ID="ValidationSummary4" runat="server" ForeColor="Red" ValidationGroup="unosGrupa2"/>
            <asp:ValidationSummary ID="ValidationSummary5" runat="server" ForeColor="Red" ValidationGroup="unosGrupa3"/>

            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Ankete]"></asp:SqlDataSource>
    </div>
    </form>
</asp:Content>
