<?php
/**
 * Created by PhpStorm.
 * User: Ben
 * Date: 2016/11/6
 * Time: 21:45
 */

namespace App\Http;


use Illuminate\Database\Eloquent\Model;

class Contents extends Model
{
    protected $table='Contents';

    protected $primaryKey='id';

    protected $fillable=['clsid','title','text'];

    public $timestamps=true;

    protected function getDateFormat()
    {
        return time();
    }
}