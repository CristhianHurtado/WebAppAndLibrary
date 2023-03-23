<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebAppCristhianHurtado_FinalRAD.Orders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <h1>Orders:</h1>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </p>
            <p>&nbsp;</p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="orlPrice" HeaderText="Price" SortExpression="orlPrice" />
                        <asp:BoundField DataField="orlQuantity" HeaderText="Quantity" SortExpression="orlQuantity" />
                        <asp:CheckBoxField DataField="orlOrderReq" HeaderText="OrderReq" SortExpression="orlOrderReq" />
                        <asp:BoundField DataField="orlNote" HeaderText="Note" SortExpression="orlNote" />
                        <asp:BoundField DataField="receiptID" HeaderText="Receipt#" SortExpression="receiptID" />
                        <asp:BoundField DataField="invPrice" HeaderText="PricePerUnit" SortExpression="invPrice" />
                        <asp:BoundField DataField="ordNumber" HeaderText="OrderNumber" SortExpression="ordNumber" />
                        <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" />
                        <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
                        <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                        <asp:BoundField DataField="payType" HeaderText="PaymentType" SortExpression="payType" />
                        <asp:BoundField DataField="Employee" HeaderText="Employee" ReadOnly="True" SortExpression="Employee" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="FinalLibrary_CristhianHurtado.EmmasDataSetTableAdapters.OrdersFromCustomerTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="Param1" SessionField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </p>
            <p>
                <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Return" />
            </p>
        </div>
</asp:Content>
