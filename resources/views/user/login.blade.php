@extends('common.layout')
@section('title')
    登陆
@stop
@section('login')
@stop

@section('middle')
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div style="width: 445px; margin-left: 315px">
                    @include('common.message')
                </div>
                <form role="form" method="post" action="{{ url('login') }}">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                    <div style="height: 60px;width: 100%">
                        <div class="form-group" >
                            <div class="col-sm-5" style="margin-left: 300px;">
                                <label for="exampleInputEmail1">邮箱</label><input type="email" name="useremail" class="form-control" id="exampleInputEmail1" />
                            </div>
                        </div>
                    </div>
                    <div style="height: 60px; width: 100%;">
                        <div class="form-group">
                            <div class="col-sm-5" style="margin-left: 300px; ">
                                <label for="exampleInputPassword1">密码</label><input type="password" name="userpass" class="form-control" id="exampleInputPassword1"/>
                            </div>
                        </div>
                    </div>
                    <div style="height: 100px;width: 200px; margin-top: 20px; margin-left: 450px">
                        <div style="display: inline-block">
                            <button type="submit" class="btn btn-default" >登陆</button>
                        </div>
                        <div style="display: inline-block; margin-left: 30px;">
                            <button type="button" class="btn btn-default" onclick="location='{{ url('createuser') }}'">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop