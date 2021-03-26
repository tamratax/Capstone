<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddServiceRequest.aspx.cs" Inherits="Lab3.AddServiceRequest" MasterPageFile="~/CustomerFacingMaster.Master" %>

<asp:Content ID="myContent" ContentPlaceHolderID="body" runat="server">
    <link href="Content/LoginFix.css" rel="stylesheet" />
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

    <body class="bg-gradient-primary">

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <h1 class="display-6 text-center">Create Service Request</h1>

                            <asp:Label ID="username" runat="server" Text="" Visible="false"></asp:Label>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                            <label>Select a Service</label>
                           
                                <asp:DropDownList
                                    ID="DdlServiceType"
                                    runat="server"
                                    class="form-control">
                                </asp:DropDownList>                         
                            </div>                              
                            <div class="form-group col-md-6">
                                <label>Service Date</label>
                                <asp:TextBox
                                    ID="TxtServiceDate"
                                    runat="server"
                                    Text=""
                                    TextMode="Date"
                                    class="form-control">
                                </asp:TextBox>
                            </div>
                    </div>
                            <asp:RequiredFieldValidator
                                ID="rfvServiceDate"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator"
                                ControlToValidate="TxtServiceDate"
                                Text="This Field Is Required"
                                ForeColor="Red"
                                SetFocusOnError="true"
                                ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                            <div class="form-group">
                                <label>Item Transport Options</label>
                                <asp:DropDownList
                                    ID="DropDownList1"
                                    runat="server"
                                    width="100%">
                                    <asp:ListItem Value="Select">Select</asp:ListItem>
                                    <asp:ListItem>We Pick-Up Your Item(s)</asp:ListItem>
                                    <asp:ListItem>You Drop-Off Your Item(s)</asp:ListItem>
                                    <asp:ListItem>Unsure</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Request Description</label>
                                <asp:TextBox
                                    ID="TxtRequestDescription"
                                    runat="server"
                                    TextMode="MultiLine"
                                    Rows="5"
                                    class="form-control"
                                    placeholder="Enter a description of your needs">
                                </asp:TextBox>
                            </div>
                            <div class="form-group float-left">
                            <asp:FileUpload ID="FilesUpload" 
                                runat="server"
                                AllowMultiple="true" />
                                <br />
                                <br />
                                <asp:Button ID="UploadButton"
                                    runat="server"
                                    OnClick="UploadButton_Click"
                                    Text="Upload File(s)" />
                                <br />
                                <asp:Label ID="FileUploadedList" runat="server" />
                            </div>
                            <br />
                            <asp:RequiredFieldValidator
                                ID="RfvRequestDescription"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator"
                                ControlToValidate="TxtRequestDescription"
                                Text="This Field Is Required"
                                ForeColor="Red"
                                SetFocusOnError="true"
                                ValidationGroup="SaveGroup"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-row justify-content-center">
                            <asp:Button
                                ID="BtnClear"
                                runat="server"
                                Text="Clear"
                                OnClick="BtnClear_Click" />

                            <asp:Button
                                ID="BtnCreateServiceRequest"
                                runat="server"
                                Text="Create Service Request ->"
                                OnClick="BtnCreateServiceRequest_Click"
                                ValidationGroup="SaveGroup" />

                            <asp:Label
                                ID="LblSaveStatus"
                                runat="server"
                                Text=""></asp:Label>
                                </div>
                            <br />
                            <div>
                                &nbsp; 
        &nbsp;
        &nbsp;
        &nbsp;
        

                            <asp:Label ID="LblGridView" runat="server" Text="Pending Service Requests:" Font-Bold="true"></asp:Label>
                            
                            <asp:GridView ID="GridRequests"
                                runat="server"
                                DataSourceID="dtasrcRequest"
                                CausesValidation="false"
                                AutoGenerateColumns="false"
                                AutoGenerateEditButton="true"
                                AutoGenerateDeleteButton="true"
                                DataKeyNames="ServiceRequestID"
                                CellPadding="3"
                                class="table justify-content-center">
                                <Columns>
                                    <asp:BoundField DataField="ServiceRequestID" Visible="false" />
                                    <asp:BoundField DataField="Service" HeaderText="Service" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                </Columns>
                            </asp:GridView>
                                
                            <asp:RequiredFieldValidator
                                ID="RfvServiceType"
                                runat="server"
                                ErrorMessage="RequiredFieldValidator"
                                ControlToValidate="DdlServiceType"
                                Text="Please Choose A Valid Option"
                                ForeColor="Red"
                                SetFocusOnError="true"
                                ValidationGroup="SaveGroup"
                                InitialValue="-1"></asp:RequiredFieldValidator>

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

    <asp:SqlDataSource ID="dtasrcRequest"
        runat="server"
        ConnectionString="<%$ConnectionStrings:Lab3%>"
        SelectCommand="SELECT ServiceRequestID, ServiceType 'Service', ServiceDate 'Date', RequestDescription 'Description' FROM SERVICEREQUEST WHERE CustomerID = (SELECT CustomerID FROM Customer WHERE email = @email)"
        DeleteCommand="DELETE SERVICEREQUEST where ServiceRequestID = @ServiceRequestID"
        UpdateCommand="UPDATE SERVICEREQUEST SET ServiceType = @Service, ServiceDate = @Date, RequestDescription = @Description WHERE ServiceRequestID = @ServiceRequestID">
        <SelectParameters>
            <asp:ControlParameter Name="email" ControlID="username" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
