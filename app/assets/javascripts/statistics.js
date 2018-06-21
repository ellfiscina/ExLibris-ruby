$(function() {
    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Livros lidos",
            value: gon.read
        }, {
            label: "Livros lendo",
            value: gon.reading
        }, {
            label: "Fila de Leitura",
            value: gon.to_read
        }],
        colors: ['#2ecc71', '#3498db', '#e74c3c'],
        resize: true
    });
});
