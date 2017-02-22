@extends('common.layout')
@section('title')
    编辑
@stop
@section('middle')
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                @include('common.message')
                @include('common.validata')
                <form role="form" method="post" action="{{ url('updatecontent') }}">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                    <div class="form-group">
                        <label for="name" >标签</label>
                        <input type="text" name="clsname" class="form-control" value={{ $data['clsname'] }} placeholder="可点击右侧标签，也可手动输入新名词">
                    </div>

                    <div class="form-group">
                        <label for="name" >标题</label>
                        <input type="text" name="title" class="form-control" value="{{ $data['title'] }}">
                    </div>

                    <div class="form-group">
                        <label for="name">内容</label>
                        <textarea class="form-control" name="text" rows="7" >{{ $data['text'] }}</textarea>
                    </div>
                    <input type="hidden" name="id" value="{{ $data['id'] }}" >
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>


            <div class="col-md-4 column">
                @foreach($cls as $cls)
                    <div style="margin-left: 8px; margin-right: 8px; margin-top: 10px; display: inline-block">
                        <span class="label label-info">{{$cls->clsname}}</span>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@stop