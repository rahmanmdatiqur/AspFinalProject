<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="HMSB.WebUserControl1" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="bg_id" CssClass="table table-bordered" DataSourceID="objBloodGroup" DefaultMode="Insert">
                <EditItemTemplate>
                    bg_id:
                    <asp:TextBox ID="bg_idTextBox" runat="server" Text='<%# Bind("bg_id") %>' />
                    <br />
                    bloodgroup:
                    <asp:TextBox ID="bloodgroupTextBox" runat="server" Text='<%# Bind("bloodgroup") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <%--                    bg_id:
                    <asp:TextBox ID="bg_idTextBox" runat="server" Text='<%# Bind("bg_id") %>' />
                    <br />--%>
                    bloodgroup:
                    <asp:TextBox CssClass="form-control" ID="bloodgroupTextBox" runat="server" Text='<%# Bind("bloodgroup") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    bg_id:
                    <asp:Label ID="bg_idLabel" runat="server" Text='<%# Bind("bg_id") %>' />
                    <br />
                    bloodgroup:
                    <asp:Label ID="bloodgroupLabel" runat="server" Text='<%# Bind("bloodgroup") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
    </ContentTemplate>
</asp:UpdatePanel>
