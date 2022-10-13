<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Artistic_Html_to_Asp_.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="stylesheet" href="style.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <!-- <script>
             google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart () {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');
    data.addColumn('number', 'Value');

    data.addRows([
                ['PH 1', 4],
                ['PH 2', 2]
            ]);

    
    var total = google.visualization.data.group(data, [{
        type: 'boolean',
        column: 0,
        modifier: function () {return true;}
    }], [{
        type: 'number',
        column: 1,
        aggregation: google.visualization.data.sum
    }]);
    
    data.addRow(['Total: ' + total.getValue(0, 1), 0]);
    
    var chart = new google.visualization.PieChart(document.querySelector('#chart_div'));
    chart.draw(data, {
        height: 400,
        width: 600,
        pieHole: 0.4,
        sliceVisibilityThreshold: 0,
        'legend': 'left'
    },
    );
}
google.load('visualization', '1', {packages:['corechart'], callback: drawChart});
    </script> -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['PH 1', 4],
                ['PH 2', 2]
            ]);

            var options = {
                pieHole: 0.5,
                'chartArea': { 'width': '100%', 'height': '90%' },
                'legend': 'none',
                colors: ['blue', 'lightblue'],
                // chartArea: {
                //     backgroundColor: {
                //         fill: '#FF0000',
                //     },
                // },
                backgroundColor: {
                    fill: 'transparent',
                    fillOpacity: 0.8
                },
            }
            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }
    </script>
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       <script type="text/javascript">
           google.charts.load("current", { packages: ["corechart"] });
           google.charts.setOnLoadCallback(drawChart);
           function drawChart() {
               var data = google.visualization.arrayToDataTable([
                   ['Task', 'Hours per Day'],
                   ['PH 2', 2],
                   ['Gas Fight Boiler', 2],
                   ['Coal Boiler', 2]
               ]);
   
               var options = {
                   pieHole: 0.5,
                   'chartArea': { 'width': '100%', 'height': '99%' },
                   'legend': 'bottom',
                   colors: ['blue', 'lightblue'],
                   // chartArea: {
                   //     backgroundColor: {
                   //         fill: '#FF0000',
                   //     },
                   // },
                   backgroundColor: {
                       fill: 'transparent',
                       fillOpacity: 0.8
                   },
               }
               var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
               chart.draw(data, options);
           }
       </script>



    <nav class="navbar">
        <div class="container-fluid ">
            <a class="navbar-brand " href="#">
                <img src="AM.png" alt="Logo" width="120" class="d-inline-block align-text-top">
                <h2 class="heading ml-2"> Energy Monitoring System</h2>
                <span></span>
            </a>
        </div>
    </nav>


    <div class="container-fluid container1">
        <h3>Electrical Overview</h3>
        <div class="container2">
            <div class="piecontainer">
                <div id="donutchart" style="width: 300px; height: 250px;">
                </div>
                <div class="relative">


                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <asp:Label ID="PGLabel" runat="server" Text='<%# Eval("PG") %>' />
                            &nbsp;KW<br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [PG] FROM [dataupdate]"></asp:SqlDataSource>

                </div>
            </div>

            <div class="item2">
                <div>Power House 1
                    <p><asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="P1GLabel" runat="server" Text='<%# Eval("P1G") %>' />
                            &nbsp;KW<br />
<br />
                        </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [P1G] FROM [dataupdate]"></asp:SqlDataSource>
&nbsp;</p>
                </div>
                <div>Power House 2
                    <p>
                        <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                &nbsp;<asp:Label ID="P2GLabel" runat="server" Text='<%# Eval("P2G") %>' />
                                &nbsp;KW<br />
<br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [P2G] FROM [dataupdate]"></asp:SqlDataSource>
                    </p>
                </div>
                <div>
                </div>
            </div>
            <div class="item3">
                <div>Natural Gas
                    <p>
                        <asp:DataList ID="DataList8" runat="server" DataSourceID="SqlDataSource8">
                            <ItemTemplate>
                                &nbsp;<asp:Label ID="NGPSILabel" runat="server" Text='<%# Eval("NGPSI") %>' />
                                &nbsp;PSI<br />
<br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [NGPSI] FROM [dataupdate]"></asp:SqlDataSource>
                    </p>
                </div>
                <div>RLNG
                    <p>
                        <asp:DataList ID="DataList9" runat="server" DataSourceID="SqlDataSource9">
                            <ItemTemplate>
                                &nbsp;<asp:Label ID="RLNGPSILabel" runat="server" Text='<%# Eval("RLNGPSI") %>' />
                                &nbsp;PSI<br />
<br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [RLNGPSI] FROM [dataupdate]"></asp:SqlDataSource>
                    </p>
                </div>
                <div>FCG
                    <p><asp:DataList ID="DataList10" runat="server" DataSourceID="SqlDataSource10">
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="FCGPSILabel" runat="server" Text='<%# Eval("FCGPSI") %>' />
                            &nbsp;PSI<br />
<br />
                        </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [FCGPSI] FROM [dataupdate]"></asp:SqlDataSource>
                    </p>
                </div>
            </div>
        </div>
    </div>
    </div>



    <div class="container-fluid container1 line">
        <h3>Steam Overview    <h3>&nbsp;</h3>
        <div class="container2">
            <div class="piecontainer">
                <div id="donutchart2" style="width: 300px; height: 250px;">
                    
                </div>
                <div class="relative">
                    <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="PSLabel" runat="server" Text='<%# Eval("PS") %>' />
                            &nbsp;T/H<br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [PS] FROM [dataupdate]"></asp:SqlDataSource>

                </div>
            </div>

            <div class="item3">
                <div>STEAM POWER house 1
                    <p>
                        <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource5">
                            <ItemTemplate>
                                &nbsp;<asp:Label ID="P1SLabel" runat="server" Text='<%# Eval("P1S") %>' />
                                &nbsp;T/H<br />
<br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [P1S] FROM [dataupdate]"></asp:SqlDataSource>
                    </p>
                </div>
                <div>POWER HOUSE 2<p><asp:DataList ID="DataList6" runat="server" DataSourceID="SqlDataSource6">
                        <ItemTemplate>
                            <asp:Label ID="P2SLabel" runat="server" Text='<%# Eval("P2S") %>' />
                            &nbsp;T/H<br />
<br />
                        </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [P2S] FROM [dataupdate]"></asp:SqlDataSource>
                    </p>
                </div>
                <div>COAL BOILER <p>
                        <asp:DataList ID="DataList7" runat="server" DataSourceID="SqlDataSource7">
                            <ItemTemplate>
                                &nbsp;<asp:Label ID="CBLabel" runat="server" Text='<%# Eval("CB") %>' />
                                &nbsp;T/H<br />
<br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:amdemosql_demoConnectionString %>" SelectCommand="SELECT [CB] FROM [dataupdate]"></asp:SqlDataSource>
                    </p>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    </form>
</body>
</html>
