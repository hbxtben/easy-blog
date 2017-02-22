@extends('common.layout')
@section('title')
    Rock'n Roll
@stop
@section('createcontent')
    @if(\Illuminate\Support\Facades\Session::get('userid')===1)
        <a class="btn btn-primary btn-large" href="{{ url("createcontent") }}">新日志</a>
    @endif
@stop

@section('middle')
    <div class="container">
        <div class="row clearfix">


            <div class="col-md-8 column">
                <div class="row clearfix">
                    <div style="width: 700px; margin-left: 15px">
                    @include('common.message')
                    </div>
                    @foreach($contents as $content)
                        <div class="col-md-9 column">
                            <div class="page-header">
                                <h3>
                                    <a href="{{ url('showcontent',['id'=>$content->id]) }}">
                                        {{$content->title}}({{\App\Http\Cls::find($content->clsid)->clsname}}） <small>{{$content->updated_at}}</small>
                                    </a>
                                </h3>
                            </div>
                        </div>
                        @if(\Illuminate\Support\Facades\Session::get('userid')===1)
                            <div class="col-md-3 column">
                                <div style="margin-top: 40px;">
                                    <a href="{{ url('updatecontent',['id'=>$content->id]) }}">
                                        <button type="button" class="btn btn-default btn-link">修改</button>
                                    </a>
                                    <a href="{{ url('deletecontent',['id'=>$content->id]) }}"   onclick="if (confirm('确定要删除吗?')==false)return false;">
                                        <button type="button" class="btn btn-default btn-link">删除</button>
                                    </a>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
                {{ $contents->links() }}
            </div>

            <div class="col-md-4 column">
                @foreach($cls as $cls)
                    <div style="margin-left: 8px; margin-right: 8px; margin-top: 10px; display: inline-block">
                        <a href="{{ url('/',['clsid'=>$cls->clsid]) }}"><span class="label label-info">{{$cls->clsname}}</span></a>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@stop