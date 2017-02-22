<?php
/**
 * Created by PhpStorm.
 * User: Ben
 * Date: 2016/11/6
 * Time: 22:10
 */

namespace App\Http\Controllers;


use App\Http\Cls;
use App\Http\Contents;
use App\Http\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class UserController extends Controller
{
    //创建用户 需要 username，useremail，userpass
    public function createUser(Request $request)
    {
        if($request->isMethod('POST')) {

            $this->validate($request,[
                'useremail'=>'required',
                'username'=>'required',
                'userpass'=>'required'
            ],[
                'required'=>':attribute 为必填项'
            ],[
                'useremail'=>'邮箱',
                'username'=>'昵称',
                'userpass'=>'密码'
            ]);

            $data['useremail']=$request->input('useremail');
            $data['username']=$request->input('username');
            $data['userpass']=$request->input('userpass');


            if(User::create($data)) {
                return redirect('login');
            } else {
                return redirect('create');
            }
        }
        return view('user/create');
    }

    public function login(Request $request)
    {
        if($request->isMethod('POST')) {
            $useremail=$request->input('useremail');
            $userpass=$request->input('userpass');
            $user=User::where('useremail','=',$useremail)->select('userid','userpass')->get();
            if(isset($user[0])) {
                if ($user[0]['userpass'] === $userpass) {
                    Session::set('userid', $user[0]['userid']);
                    return redirect('/');
                }
            }
            return redirect('login')->with('error','登陆信息错误');
        }
        return view('user/login');
    }

    //登出，清除session 用户信息
    //Session::forget();
    public function logout()
    {
        Session::forget('userid');
        return redirect('/');
    }
}