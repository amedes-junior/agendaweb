var Dashboard = {
  loadChartByGender: function() {
    $.ajax({
      method: "get",
      url: "/contacts/dashboard",
      dataType: "json",
      success: function(rt) {
        Highcharts.chart('container', {
          chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
          },
          title: {
            text: 'Contatos por Gênero'
          },
          series: [{
            name: 'Quantidade',
            colorByPoint: true,
            data: rt.data
          }]
        });
      }
    })
  }
}

$(document).ready(function() {
  $('#dataNasc').mask('99/99/9999');
  $('#contact_cellphone').mask('(99)99999 9999');
  Dashboard.loadChartByGender()
})
