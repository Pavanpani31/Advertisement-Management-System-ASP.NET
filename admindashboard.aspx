<%@ Page Language="C#" EnableEventValidation="false"  AutoEventWireup="true" CodeBehind="admindashboard.aspx.cs" Inherits="advertiseManegement.admindashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard</title>

    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <script type="text/javascript">
        window.addEventListener("pageshow", function (event) {
            if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
                window.location.reload();
            }
        });
    </script>


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .content {
            flex: 1 0 auto;
        }

        .footer-bar {
            background-color: rgba(2, 70, 2, 0.94);
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 16px;
            flex-shrink: 0;
        }

        .header-bar {
            background-color: rgba(2, 70, 2, 0.94);
            color: white;
            padding: 10px;
        }

        .dashboard-title {
            text-align: center;
            margin: 20px 0;
        }

        .table-container {
            margin: 20px auto;
            max-width: 95%;
        }

        .scrollable-grid {
            max-height: 300px;
            overflow-y: auto;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      
        <%--<div class="container-fluid header-bar">
            <div class="row">
                <div class="col-sm-2"><strong>Admin</strong></div>
                <div class="col-sm-10 text-right">
                    
                    <a href="welcome.aspx" style="padding: 10px; color: white;">Manage User</a> | 
                    <a href="AdManagement.aspx" style="padding: 10px; color: white;">Manage Ads</a> |
                    <a href="logout.aspx" style="padding: 10px; color: white;">Logout</a>
                </div>
            </div>
        </div>--%>

                        <!--- hamburger menu --->
<nav class="navbar navbar-inverse" style="background-color: rgb(2,70,2); padding: 4px 10px; min-height: 36px;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="welcome.aspx"
               style="color: white; font-size: 16px; padding: 5px 10px;">
                UserManage
            </a>
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#mainNavbar"
                    aria-expanded="false" style="margin-top: 4px;">
                <span class="icon-bar" style="background-color: white; height: 2px;"></span>
                <span class="icon-bar" style="background-color: white; height: 2px;"></span>
                <span class="icon-bar" style="background-color: white; height: 2px;"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse justify-content-center" id="mainNavbar">
            <ul class="nav navbar-nav navbar-right">
                 <li><a href="admindashboard.aspx" style="color: white; padding: 5px 10px;">Manage User  | </a></li>
                 <li><a href="AdManagement.aspx" style="color: white; padding: 5px 10px;">Manage Ads  | </a></li>
                 <li><a href="logout.aspx" style="color: white; padding: 5px 10px;">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
      
<div class="container" style="min-height: 500px; margin-top: 30px;">
    <div class="row">
        <div class="col-md-12">

            <h2 class="dashboard-title text-center">Admin Dashboard</h2>

            <!---- user grid --->
            <h4>User Management</h4>
            <div class="scrollable-grid">
                <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="email"
                CssClass="table table-bordered" OnRowCommand="GridViewUsers_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" />
                        <asp:BoundField DataField="firstName" HeaderText="First Name" />
                        <asp:BoundField DataField="lastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="status" HeaderText="Status" />

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnApprove" runat="server" Text="Approve"
                                    CssClass="btn btn-success"
                                    CommandName="ApproveUser"
                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                   Enabled='<%# Eval("status") != null && Eval("status").ToString().Trim().ToLower() == "pending" %>' />

                                <asp:Button ID="btnReject" runat="server" Text="Reject"                                    
                                    CssClass="btn btn-warning"
                                    CommandName="RejectUser"
                                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'
                                    Enabled='<%# Eval("status") != null && Eval("status").ToString().Trim().ToLower() == "pending" %>' />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:ButtonField  ButtonType="Button" CommandName="DeleteUser" ControlStyle-CssClass="btn btn-danger" Text="Delete" >
<ControlStyle CssClass="btn btn-danger"></ControlStyle>
                        </asp:ButtonField>

                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Donload Excel Format" ControlStyle-CssClass="btn btn-success" OnClick="Button1_Click" Width="233px" />
            <asp:Button ID="Button2" runat="server" Text="Donload Word Format" ControlStyle-CssClass="btn btn-success" OnClick="Button2_Click" Width="233px" /> 


        </div>
    </div>
</div>


<div class="footer-bar">
     <p style="font-size:20px;">         

         Copyright &copy; 2014-
     <script>document.write(new Date().getFullYear())</script> Your Name. All Rights Reserved
 </p>
</div>
        
        </form>
    </body>
</html>