@extends('common.layout')
@section('title')
    注册
@stop
@section('login')
@stop

@section('middle')
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                @include('common.validata')

                <form role="form" method="post" action="{{ url('createuser') }}">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                    <div style="height: 60px; width: 100%;">
                        <div class="form-group">
                            <div class="col-sm-5" style="margin-left: 300px; ">
                                <label for="exampleInputPassword1">昵称</label><input name="username" type="text" class="form-control" id="exampleInputPassword1"/>
                            </div>
                        </div>
                    </div>
                    <div style="height: 60px;width: 100%">
                        <div class="form-group" >
                            <div class="col-sm-5" style="margin-left: 300px;">
                                <label for="exampleInputEmail1">邮箱</label><input name="useremail" type="email" class="form-control" id="exampleInputEmail1" />
                            </div>
                        </div>
                    </div>
                    <div style="height: 60px; width: 100%;">
                        <div class="form-group">
                            <div class="col-sm-5" style="margin-left: 300px; ">
                                <label for="exampleInputPassword1">密码</label><input name="userpass" type="password" class="form-control" id="exampleInputPassword1"/>
                            </div>
                        </div>
                    </div>

                    <div style="height: 100px;width: 100px; margin-top: 20px; margin-left: 500px">
                        <button type="submit" class="btn btn-default">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop