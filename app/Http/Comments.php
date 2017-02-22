<?php
/**
 * Created by PhpStorm.
 * User: Ben
 * Date: 2016/11/6
 * Time: 21:49
 */

namespace App\Http;


use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    protected $table='comments';

    protected $primaryKey='commentid';

    protected $fillable=['userid','id','comment'];

    public $timestamps=true;

    protected function getDateFormat()
    {
        return time();
    }
}