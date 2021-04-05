<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacingMaster.Master" AutoEventWireup="true" CodeBehind="CustomerServiceChoice.aspx.cs" Inherits="Lab3.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <link href="Content/CustLandingPage.css" rel="stylesheet" />
    <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Login</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <div class="NiceBackground">
        <body class="bg-gradient-primary">
            <div class="container">

                <!-- Outer Row -->
                <div class="row justify-content-center">
                    <h2 class="display-4" style="color: #FFFFFF">Welcome to Green Valley Auctions</h2>
                    <div class="col-xl-10 col-lg-12 col-md-9">

                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <h4 class="row justify-content-center">Place a Service Request to get Started!</h4>
                            <asp:Button
                                ID="BtnRequestAppraisal"
                                runat="server"
                                Text="Request Appraisal"
                                OnClick="BtnRequestAppraisal_Click" />
                            <asp:Button ID="BtnRequestMove"
                                runat="server"
                                Text="Request Move"
                                OnClick="BtnRequestMove_Click" />
                            <asp:Button ID="BtnRequestAuction" 
                                runat="server" 
                                Text="Request Auction" 
                                OnClick="BtnRequestAuction_Click" />
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    </body>
    </html>
</asp:Content>
