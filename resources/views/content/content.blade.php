@extends('common.layout')
@section('title')
    {{ $data['title'] }}
@stop
@section('middle')
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">


                    <div class="col-md-8 column">
                        <h2>
                            {{ $data['title'] }}
                        </h2>
                        <p>
                            {{ $data['text'] }}
                        </p>
                        <p style="margin-left: 400px">
                            {{ date('Y-m-d',$data['create_time']) }} >>
                        </p>
                        <br/><br/>

                        @foreach($comment as $comment)
                            <div class="page-header">
                                <h5>
                                    {{ $comment['comment'] }} <small>  {{ $comment['username'] }}  >>{{ $comment['create_time'] }}</small>
                                </h5>
                            </div>
                        @endforeach

                        @include('common.validata')

                        @if($userid=\Illuminate\Support\Facades\Session::get('userid'))
                            <form role="form" method="post" action="{{ url('createcomment') }}">
                                <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                                <div class="form-group">
                                    <label for="name">评论</label>
                                    <textarea class="form-control" name="comment" rows="3"></textarea>
                                </div>
                                <input type="hidden" name="id" value={{  $data['id'] }}>
                                <button type="submit" class="btn btn-default" >提交</button>
                            </form>
                        @endif
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
        </div>
    </div>
@stop