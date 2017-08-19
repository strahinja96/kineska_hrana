<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Admin_panel.aspx.cs" Inherits="KineskaHrana.Admin_Panel.Admin_panel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin panel</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="tekstCentar adminLista">
        <li><a href="Ankete_upravljanje.aspx">Upravljanje anketama</a></li>
        <li><a href="Galerija_upravljanje.aspx">Upravljanje galerijom</a></li>
        <li><a href="Jela_upravljanje.aspx">Upravljanje jelima</a></li>
        <li><a href="Kontakt_upravljanje.aspx">Upravljanje kontaktima</a></li>
        <li><a href="Korisnici_upravljanje.aspx">Upravljanje korisnicima</a></li>
        <li><a href="Meni_upravljanje.aspx">Upravljanje menijima</a></li>
        <li><a href="Narudzbine_upravljanje.aspx">Upravljanje narudzbinama</a></li>
        <li><a href="Uloge_upravljanje.aspx">Upravljanje ulogama</a></li>
        <li><a href="Dogadjaji_upravljanje.aspx">Upravljanje dogadjajima</a></li>
    </ul>
</asp:Content>
