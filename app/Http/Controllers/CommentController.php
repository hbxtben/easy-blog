<?php
/**
 * Created by PhpStorm.
 * User: Ben
 * Date: 2016/11/7
 * Time: 09:23
 */

namespace App\Http\Controllers;


use App\Http\Comments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class CommentController extends Controller
{
    public function createComment(Request $request)
    {
        $data['userid']=Session::get('userid');
        $data['id']=$request->input('id');
        $data['comment']=$request->input('comment');

        $this->validate($request,[
            'comment'=>'required',
        ],[
            'required'=>':attribute 为必填项'
        ],[
            'commen'=>'评论'
        ]);

        if(Comments::create($data)) {
            return redirect('showcontent/'.$data['id'])->with('success','评论添加成功!');
        } else {
            return redirect('showcontent/'.$data['id']);
        }
    }
}