@if(\Illuminate\Support\Facades\Session::has("success"))
    <div  class="alert alert-success alert-dismissable" role="alert">
        <strong>成功!</strong> {{ \Illuminate\Support\Facades\Session::get("success") }}
    </div>
@endif



@if(\Illuminate\Support\Facades\Session::has("error"))
    <div class="alert alert-danger alert-dismissable" role="alert">
        <strong>失败!</strong>   {{ \Illuminate\Support\Facades\Session::get('error') }}
    </div>
@endif