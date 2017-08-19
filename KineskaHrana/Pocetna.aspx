<%@ Page Title="" Language="C#" MasterPageFile="~/Sablon.Master" AutoEventWireup="true" CodeBehind="Pocetna.aspx.cs" Inherits="KineskaHrana.Pocetna" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pocetna</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container50 centerDiv marginTop50">
        <div class="sliderOkvir">
            <div id="slider" class="sliderBox">
                <ul id="sliderUl" runat="server">

                </ul>

            </div>

        </div>
    </div>
    <h1 class="tekstCentar">Jelovnik</h1>
    <div class="container80 centerDiv marginTop50" id="jelovnikDiv" runat="server">
            
    </div>
    <div class="cleaner"></div>
</asp:Content>
