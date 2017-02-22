<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Jorben 公社 - @yield('title')</title>
        <link rel="shortcut icon" href="{{ asset('static/image/') }}" type="image/x-icon" />
        <link href="{{ asset('static/css/bootstrap.min.css') }}" rel="stylesheet">
        <link href="{{ asset('static/css/layout.css') }}" rel="stylesheet">
        @yield('css')
        @yield('js')
    </head>
    <body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="jumbotron">
                    <h1>
                        <a href=" {{ url('/') }} ">
                            Jorben -公社
                        </a>
                    </h1>
                    @section('login')
                        @if($userid=\Illuminate\Support\Facades\Session::get('userid'))

                                <a class="btn btn-primary btn-large" href="">{{ \App\Http\User::find($userid)->username }}</a>
                                <a class="btn btn-primary btn-large" href="{{ url("logout") }}">注销</a>
                        @else
                                <a class="btn btn-primary btn-large" href="{{ url("login") }}">登陆</a>
                        @endif
                        @yield('createcontent')
                    @show
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                @section('middle')
                @show
            </div>
        </div>
        <div class="footer">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <h6 class="text-center">
                        @2016 Jorben
                    </h6>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>