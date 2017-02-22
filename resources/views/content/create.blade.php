@extends('common.layout')
@section('title')
    新日志
@stop
@section('js')
    <script type="text/javascript" >
        function myClickLable(labletext)
        {
            document.getElementsByName('clsname')[0].value=labletext;
        }
    </script>
@stop
@section('middle')
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                @include('common.validata')
                <form role="form" method="post" action="{{ url('createcontent') }}">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                    <div class="form-group">
                        <label for="name" >标签</label>
                        <input type="text" name="clsname" class="form-control" value="" placeholder="可点击右侧标签，也可手动输入新名词">
                    </div>

                    <div class="form-group">
                        <label for="name" >标题</label>
                        <input type="text" name="title" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="name">内容</label>
                        <textarea class="form-control" name="text" rows="7"></textarea>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>


            <div class="col-md-4 column">
                @foreach($cls as $cls)
                    <div style="margin-left: 8px; margin-right: 8px; margin-top: 10px; display: inline-block">
                        <button style="border: 0;" class="label label-info" onclick="myClickLable('{{ $cls->clsname }}')"><span>{{$cls->clsname}}</span></button>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@stop


