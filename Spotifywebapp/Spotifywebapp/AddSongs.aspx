<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSongs.aspx.cs" Inherits="Spotifywebapp.AddSongs" MasterPageFile="~/Masterpage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        var winW = $(window).width() - 180;
        var winH = $(window).height() - 180;

        $(function () {
            $("#<%= txtDate.ClientID%>").datepicker({
                dateFormat: 'dd-M-yy',
                changeYear: 'true',
                changeMonth: 'true',
                yearRange: '1900:2050',
            }).val();

        });
        $(function () {
            $("#<%= txtdob.ClientID%>").datepicker({
                dateFormat: 'dd-M-yy',
                changeYear: 'true',
                changeMonth: 'true',
                yearRange: '1900:2050',
            }).val();

        });

        function FunVal() {
            if (Page_ClientValidate("ValidateData")) {
                // $('#mydiv').hide();
                //alert("Check")
            }

        }

        function FunVal() {
            if (Page_ClientValidate("ValidateData1")) {
                // $('#mydiv').hide();
                //alert("Check")
            }

        }


    </script>
    <style type="text/css">
        body {
            overflow-x: hidden;
        }

        .modal-backdrop {
            z-index: -1;
        }
    </style>
    <style type="text/css">
        .body {
            font-family: Arial;
            font-size: 10pt;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
        }

            .modalPopup .header {
                background-color: #006dcc;
                height: 35px;
                color: White;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .footer {
                padding: 3px;
            }

        .center td {
            padding: 15px;
        }

        .center tr {
            padding: 15px;
        }

        .center th {
            padding: 15px;
        }
    </style>






    <div class="center">

        <table>
            <tr>
                <th style="font-size: 25px">Adding a new Song
                </th>
            </tr>
            <tr>
                <td>Song Name</td>
                <td>
                    <asp:TextBox ID="txtSongName" runat="server" CssClass="form-control"
                        ClientIDMode="Static" placeholder="Enter song name" AutoCompleteType="Disabled" Style="width: 200px;" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSongName"
                                            Display="Dynamic" Font-Bold="true" Font-Size="Small" ForeColor="Red" ErrorMessage="Please enter song name"
                                           ValidationGroup="ValidateData1" ID="RequiredFieldValidator1"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td>Date release</td>

                <td>
                    <asp:TextBox ID="txtDate" runat="server" placeholder="Enetr release date" CssClass="form-control" ClientIDMode="Static" onkeypress="return false;" AutoCompleteType="Disabled" /></td>


            </tr>
            <tr>
                <td>Artwork</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <%--<asp:Button ID="btnUpload" Text="Upload" runat="server"  />--%>
                    
                    <%--<asp:TextBox ID="TextBox2" input-type="File" runat="server" CssClass="form-control"
                        ClientIDMode="Static" AutoCompleteType="Disabled" Style="width: 200px;" />--%></td>

            </tr>
            <tr>
                <td>Artist</td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlArtist" CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>


                </td>
                <td>
                    <asp:Button ID="btnAddArtist" runat="server" CssClass="btn btn-secondary" Text="Add Artist" OnClick="AddArtist" />
                </td>

            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="AddNewSong"  ValidationGroup="ValidateData1" />
                    <asp:Label ID="lblResult2" runat="server" Visible="false"></asp:Label>
                </td>


            </tr>




        </table>
    </div>

    <div class="modal fade  modal-95" id="PopupTrackChanges" role="dialog" aria-labelledby="udp1"
        aria-hidden="true">
        <div class="modal-dialog modal-85">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="100" AssociatedUpdatePanelID="udp1">
                <ProgressTemplate>
                    <div style="position: absolute; visibility: visible; border: none; z-index: 100; left: 48%; top: 50%; width: 10%; height: 9%; background: transparent; filter: alpha(opacity=100); -moz-opacity: .8; opacity: .8;">
                        <asp:Image ID="imguserList" runat="server" ImageUrl="~/Images/main-loader.gif" Style="top: 0%; z-index: 1000 !important; left: -50%; position: absolute; height: 70px; width: 70px" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="udp1" runat="server" ChildrenAsTriggers="false"
                UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header bg-primary">
                            <h4 class="modal-title">
                                <asp:Label ID="Label1" runat="server" Text="Add Artist"></asp:Label>
                                <asp:Label ID="lblItemClicked" runat="server" Visible="false"></asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">


                            <table style="padding: 50px" class="center">
                                <tr>
                                    <td>Artist name 
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtArtistName" runat="server" CssClass="form-control"
                                            ClientIDMode="Static" placeholder="Enter name" AutoCompleteType="Disabled" Style="width: 300px;" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtArtistName"
                                            Display="Dynamic" Font-Bold="true" Font-Size="Small" ForeColor="Red" ErrorMessage="Please enter name"
                                           ValidationGroup="ValidateData" ID="rfv_txtname"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Date Of Birth
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtdob" runat="server" placeholder="Enetr date of birth" CssClass="form-control" ClientIDMode="Static" onkeypress="return false;" AutoCompleteType="Disabled" /></td>

                                </tr>
                                <tr>
                                    <td>Bio 
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBio" runat="server" CssClass="form-control" TextMode="MultiLine"
                                            ClientIDMode="Static" placeholder="Enter bio" AutoCompleteType="Disabled" Style="width: 300px;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" Text="Cancel" />
                                        <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="AddNewArtist" ValidationGroup="ValidateData" />
                                        <asp:Label ID="lblResult" runat="server" Visible="false"></asp:Label>
                                    </td>


                                </tr>

                            </table>


                            <div class="modal-footer">
                                <asp:Button ID="Button2" runat="server" Text="Close" data-dismiss="modal"
                                    CssClass="btn btn-info" UseSubmitBehavior="false" ToolTip="Click to close dialouge box" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
