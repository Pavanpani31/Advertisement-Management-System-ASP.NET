<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageads.aspx.cs" Inherits="advertiseManegement.manageads" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage My Ads</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <script type="text/javascript">
    window.addEventListener("pageshow", function (event) {
        if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
            window.location.reload();
        }
    });
    </script>

    
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .header-bar, .footer-bar {
            background-color: rgba(2,70,2,0.94);
            color: white;
            padding: 10px;
        }

        .footer-bar {
            text-align: center;
            font-size: 18px;
            padding-top: 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .content-area {
            min-height: 500px;
            padding-bottom: 70px; 
        }

        .table-container {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

       <%-- <div class="container-fluid header-bar">
            <div class="row">
                <div class="col-sm-4"><strong>User</strong></div>
                <div class="col-sm-8 text-right">
                <a href="welcome.aspx" style="padding: 10px; color: white;">User</a> |
                <a href="addAds.aspx" style="padding: 10px; color: white;">Add Ads Ads</a> |
                <a href="manageads.aspx" style="padding: 10px; color: white;">Manage Ads</a> |
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
                ManageAds
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
                <li><a href="welcome.aspx" style="color: white; padding: 5px 10px;">User |</a></li>
                <li><a href="addAds.aspx" style="color: white; padding: 5px 10px;">Add Ads |</a></li>
                <li><a href="manageads.aspx" style="color: white; padding: 5px 10px;">Manage Ads |</a></li>
                <li><a href="logout.aspx" style="color: white; padding: 5px 10px;">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

        <div class="container content-area">
            <h2 class="text-center">My Advertisements</h2>
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" ForeColor="Green" />

            <div class="table-container">
                <asp:GridView ID="gvAds" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-bordered"
                    DataKeyNames="id"
                    OnRowCommand="gvAds_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Ad ID" />
                        <asp:BoundField DataField="title" HeaderText="Title" />
                        <asp:BoundField DataField="status" HeaderText="Status" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete"
                                    CommandName="DeleteAd"
                                    CommandArgument='<%# Container.DataItemIndex %>'
                                    CssClass="btn btn-danger btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
        </div>

        <div class="footer-bar">
            &copy; 2025 Advertise Management - All Rights Reserved
        </div>
    </form>
</body>
</html>
