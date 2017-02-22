<?php
/**
 * Created by PhpStorm.
 * User: Ben
 * Date: 2016/11/6
 * Time: 21:42
 */

namespace App\Http;


use Illuminate\Database\Eloquent\Model;

class Cls extends Model
{
    protected $table='cls';

    protected $primaryKey='clsid';

    protected $fillable=['clsname','num'];

    public $timestamps=false;
}