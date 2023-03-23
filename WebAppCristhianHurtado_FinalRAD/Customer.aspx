<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="WebAppCristhianHurtado_FinalRAD.Customer" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>Customers:</h1>
        <p>Select a customer to show its orders.</p>
        <hr />
        <div class="row">
            <div class="col-md-4">
                <p>
                    Insert new record:
                </p>
                <p>
                    First Name:
                    <asp:TextBox ID="TextBoxF" runat="server"></asp:TextBox>
                </p>
                <p>
                    Last Name:
                    <asp:TextBox ID="TextBoxL" runat="server"></asp:TextBox>
                </p>
                <p>
                    Phone:
                    <asp:TextBox ID="TextBoxP" runat="server"></asp:TextBox>
                </p>
                <p>
                    Address:
                    <asp:TextBox ID="TextBoxA" runat="server"></asp:TextBox>
                </p>
                <p>
                    City:
                    <asp:TextBox ID="TextBoxC" runat="server"></asp:TextBox>
                </p>
                <p>
                    Postal Code:
                    <asp:TextBox ID="TextBoxPC" runat="server"></asp:TextBox>
                </p>
                <p>
                    Email:
                    <asp:TextBox ID="TextBoxE" runat="server"></asp:TextBox>
                </p>
                <p>
                    <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Insert" />
                </p>
                <p>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                            <asp:BoundField DataField="custFullName" HeaderText="Name" ReadOnly="True" SortExpression="custFullName" />
                            <asp:BoundField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" />
                            <asp:BoundField DataField="custAddress" HeaderText="Address" SortExpression="custAddress" />
                            <asp:BoundField DataField="custCity" HeaderText="City" SortExpression="custCity" />
                            <asp:BoundField DataField="custPostal" HeaderText="Postal" SortExpression="custPostal" />
                            <asp:BoundField DataField="custEmail" HeaderText="Email" SortExpression="custEmail" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </p>
                <p>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalLibrary_CristhianHurtado.EmmasDataSetTableAdapters.customerTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="custFirst" Type="String" />
                            <asp:Parameter Name="custLast" Type="String" />
                            <asp:Parameter Name="custPhone" Type="String" />
                            <asp:Parameter Name="custAddress" Type="String" />
                            <asp:Parameter Name="custCity" Type="String" />
                            <asp:Parameter Name="custPostal" Type="String" />
                            <asp:Parameter Name="custEmail" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="custFirst" Type="String" />
                            <asp:Parameter Name="custLast" Type="String" />
                            <asp:Parameter Name="custPhone" Type="String" />
                            <asp:Parameter Name="custAddress" Type="String" />
                            <asp:Parameter Name="custCity" Type="String" />
                            <asp:Parameter Name="custPostal" Type="String" />
                            <asp:Parameter Name="custEmail" Type="String" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </p>
            </div>
        </div>
    </div>


</asp:Content>

