<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="Spotifywebapp.Artist" MasterPageFile="~/Masterpage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        var winW = $(window).width() - 180;
        var winH = $(window).height() - 180;
        var MainGrid;


        //add tabel name

        $(document).ready(function () {


            MainGrid = $('#tblMainGrid').dataTable({
                "bJQueryUI": true,
                "bDestroy": true,
                "bRetrieve": true,
                "sScrollY": winH - 120,
                "aLengthMenu": [[100, 150, 200, -1], [100, 150, 200, "All"]],

                "iDisplayLength": -1,


            });

        });



        //Create Page Load  and check partial page load, in case of partial page load call all jquery function again to beautify jquery datatable.
        function pageLoad(sender, args) {

            if (args.get_isPartialLoad()) {

                MainGrid = $('#tblMainGrid').dataTable({
                    "bJQueryUI": true,
                    "bDestroy": true,
                    "bRetrieve": true,
                    "sScrollY": winH - 120,
                    "aLengthMenu": [[100, 150, 200, -1], [100, 150, 200, "All"]],

                    "iDisplayLength": -1,


                });


                Details = $('#tblMainGrid').dataTable();


            }
        }

    </script>


    <asp:UpdatePanel ID="udpMain" UpdateMode="Conditional" ChildrenAsTriggers="true"
        runat="server">
        <ContentTemplate>

            <table width="100%" cellpadding="0" cellspacing="0">


                <tr>
                    <td colspan="2">
                        <div>
                            <asp:Panel ID="pnlmain" runat="server">
                                <asp:Repeater ID="rptArtist" runat="server">
                                    <HeaderTemplate>

                                        <table id="tblMainGrid" width="100%" cellpadding="0" cellspacing="0" border="0"
                                            class="display">
                                            <thead>
                                                <tr>

                                                    <th>Artist
                                                    </th>
                                                    <th>Date of Birth
                                                    </th>

                                                    <th>Songs
                                                    </th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>

                                            <td>
                                                <%# Eval("Name")%>
                                            </td>
                                            <td>
                                                <%# Eval("DOB")%>
                                            </td>

                                            <td>
                                                <%# Eval("SongName")%>
                                            </td>
                                           
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                       <%-- <tfoot>
                                            <tr>

                                                <th></th>
                                                <th></th>

                                                <th></th>
                                                <th></th>
                                                <th class="text-center">
                                                    <asp:UpdatePanel ID="upAddSongs" runat="server">
                                                        <ContentTemplate>
                                                            <asp:LinkButton ID="lnkbtnAddSongs" runat="server" ToolTip="Add Songs"
                                                                CssClass="btn btn-success btn-circle btn-sm" OnClick="AddSongs">
                                                                        <span aria-hidden="true" style="color:white">Add Songs</span>
                                                            </asp:LinkButton>

                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="lnkbtnAddSongs" EventName="click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </th>
                                            </tr>--%>
                                        </tfoot>
                                        </tbody> </table>
                                    </FooterTemplate>

                                </asp:Repeater>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
