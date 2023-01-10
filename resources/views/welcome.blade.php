<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <title>KANBAN BOARD</title>

</head>

<body>
    @if (Session::get('error_db'))
        <div class="alert alert-danger"> {{ Session::get('error_db') }}</div>
    @endif
    <div id="app">
        <main-component></main-component>
    </div>
    <script src="{{ mix('/js/app.js') }}"></script>
</body>

</html>
