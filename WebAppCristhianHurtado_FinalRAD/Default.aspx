<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppCristhianHurtado_FinalRAD._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Home</h1>
        <p class="lead">Look for inventory and customers information</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Inventory</h2>
            <p>
                Take a look to all the inventorythat is in stock</p>
            <p>
                <a class="btn btn-default" href="Inventory">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Customers</h2>
            <p>
                Look for the customers that have been ingresed in the system and their respective orders</p>
            <p>
                <a class="btn btn-default" href="Customer">Go &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
