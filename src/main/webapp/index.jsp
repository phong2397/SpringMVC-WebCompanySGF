<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Loading.....</title>
    <meta name="description"
          content="Learn how to recreate the preloader from Cantina Negrar. Tutorial for a passionate front-end web developers by Petr Tichy.">

    <!--iOS -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/main-load.css">
    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    <script src="js/vendor/jquery-1.9.1.min.js"></script>
    <style type="text/css">
        .back-link a {
            color: #4ca340;
            text-decoration: none;
            border-bottom: 1px #4ca340 solid;
        }

        .back-link a:hover,
        .back-link a:focus {
            color: #408536;
            text-decoration: none;
            border-bottom: 1px #408536 solid;
        }

        h1 {
            height: 100%;
            /* The html and body elements cannot have any padding or margin. */
            margin: 0;
            font-size: 14px;
            font-family: 'Open Sans', sans-serif;
            font-size: 32px;
            margin-bottom: 3px;
        }
    </style>
</head>
<body class="demo">
<div id="demo-content">

    <header class="entry-header">
    </header>

    <div id="loader-wrapper">
        <div id="loader"></div>
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>

</div>
<script type="text/javascript">
    $(document).ready(function () {
        setTimeout(function () {
            $('body').addClass('loaded');
            window.location.replace("import");
        }, 3000);
    });
</script>
</body>
</html>
