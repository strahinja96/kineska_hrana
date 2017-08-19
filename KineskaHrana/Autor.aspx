<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Autor.aspx.cs" Inherits="KineskaHrana.Autor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <table class="tableMain" id="autorTabela" runat="server">
        <tr>
            <td>  
            </td>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/author.jpg" Width="300px" />
            </td>
            <td>
                Moje ime je Strahinja Balalić, trenutno sam student završne godine na Visokoj ICT školi. <br />Programiranjem se bavim od srednje škole kada sam pohađao informatički smer gimnazije. <br />U slobodno vreme bavim se muzikom, a u budućnosti se nadam da ću postati profesionalni C# programer.<br /><br /><b>91/14, IT, strahinja.balalic.91.14@ict.edu.rs</b>
            </td>
        </tr>
        </table>
    </form>
</asp:Content>
