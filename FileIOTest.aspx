<%@ Page Title="" Language="C#" MasterPageFile="~/LabFormat.Master" AutoEventWireup="true" CodeBehind="FileIOTest.aspx.cs" Inherits="Lab3.FileIOTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div>
        <h1>Customer Files</h1>
        <asp:BulletedList ID="blistFileLinks" 
            runat="server" 
            DisplayMode="HyperLink" 
            OnClick="blistFileLinks_Click"
            OnPreRender="blistFileLinks_PreRender"
            Target="_blank"></asp:BulletedList>
    </div>
</asp:Content>
