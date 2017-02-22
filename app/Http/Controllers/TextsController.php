<?php
/**
 * Created by PhpStorm.
 * User: Ben
 * Date: 2016/11/6
 * Time: 21:28
 */

namespace App\Http\Controllers;


use App\Http\Cls;
use App\Http\Comments;
use App\Http\Contents;
use App\Http\User;
use Illuminate\Http\Request;


class TextsController extends Controller
{
    //创建新日志 需要 clsname,title，text
    public function createContent(Request $request)
    {
        if($request->isMethod('POST')) {

            $this->validate($request,[
                'title'=>'required',
                'text'=>'required',
                'clsname'=>'required'
            ],[
                'required'=>':attribute 为必填项'
            ],[
                'title'=>'标题',
                'text'=>'内容',
                'clsname'=>'标签'
            ]);

            $clsname=$request->input('clsname');

            Cls::firstOrCreate(['clsname' => $clsname]);
            $cls=Cls::where('clsname','=',$clsname)->get()[0];
            $cls->num++;
            $cls->save();
            $data['clsid']=$cls->clsid;
            $data['title']=$request->input('title');
            $data['text']=$request->input('text');

            if(Contents::create($data)) {
                return redirect('/')->with('success','日志添加成功');
            } else {
                return redirect('createcontent');
            }
        }
        $cls=Cls::get();
        return view('content/create',['cls'=>$cls]);
    }

    public function deleteContent($id)
    {
        $content=Contents::find($id);
        $cls=Cls::where('clsid','=',$content->clsid)->get()[0];
        $cls->num--;
        if ($content->delete()){
            if ($cls->num===0){
                $cls->delete();
            }
            return redirect('/')->with('success','删除成功');
        }else{
            return redirect('/')->with('error','删除失败');
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View
     * [GET]: id
     * [POST]:id,title,text
     */
    public function updateContent(Request $request,$id=0)
    {
        if($request->isMethod('POST')) {
            $content = Contents::find($request->input('id'));
            $content->title = $request->input('title');
            $content->text = $request->input('text');
            if ($content->save()) {
                return redirect('showcontent/'.$content->id)->with('success', '日志修改成功');
            }
            return redirect('content/update/'.$content->id);
        }else{
            $cls=Cls::get();
            $result=$this->readContent($id);
            return view('content/update',['data'=>$result,'cls'=>$cls]);
        }
    }

    /**
     * POST传递参数 urlid
     * 按照修改时间排序
     * 返回日志信息数组
     * 展示分页 用 {{$content->render()}}
     */
    public function showLists($clsid=0)
    {
        $cls=Cls::get();

        if($clsid!==0){
            $content=Contents::where('clsid','=',$clsid)->select('id','clsid','title','updated_at')->orderBy('updated_at','desc')->paginate(6);
            return view('index/index',['contents'=>$content,'cls'=>$cls]);
        }else{
            $content=Contents::select('id','clsid','title','updated_at')->orderBy('updated_at','desc')->paginate(6);
            return view('index/index',['contents'=>$content,'cls'=>$cls]);
        }
    }

    //展示日志页面
    public function showContent($id)
    {
        $cls=Cls::get();
        $result=$this->readContent($id);
        $comment=$this->readComment($id);

        return view('content/content',['data'=>$result,'comment'=>$comment,'cls'=>$cls]);
    }

    //根据日志ID 获取日志内容
    public function readContent($contentid)
    {
        $result['clsname']=Cls::where('clsid','=',Contents::where('id','=',$contentid)->pluck('clsid')[0])->pluck('clsname')[0];
        $result['title']=Contents::where('id','=',$contentid)->pluck('title')[0];
        $result['text']=Contents::where('id','=',$contentid)->pluck('text')[0];
        $result['create_time']=Contents::where('id','=',$contentid)->pluck('created_at')[0];
        $result['id']=$contentid;

        return $result;
    }

    //根据日志ID 获取该日志评论  返回 array()
    public function readComment($contentid)
    {
        $pacage=Comments::where('id','=',$contentid)->select('userid','comment','created_at')->get();
        $comment=[];
        foreach ($pacage as $key => $value)
        {
            $comment[$key]['username']=User::where('userid','=',$value['userid'])->pluck('username')[0];
            $comment[$key]['comment']=$value['comment'];
            $comment[$key]['create_time']=$value['created_at'];
        }

        return $comment;
    }
}