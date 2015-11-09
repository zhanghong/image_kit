var page = require('webpage').create();
page.viewportSize = { width: 320, height: 480 };
page.open('http://localhost:3000/products/series', function (status) {
    if (status !== 'success') {
        console.log('Unable to access the network!');
    } else {
        // page.evaluate(function () {
        //   var body = document.body;
        //   body.style.backgroundColor = '#fff';
        //   body.querySelector('div#title-block').style.display = 'none';
        //   body.querySelector('form#edition-picker-form').parentElement.parentElement.style.display = 'none';
        // });
        page.render('technews.png');
    }
    phantom.exit();
});