<?php
/**
 * Created by PhpStorm.
 * User: Ben
 * Date: 2016/11/6
 * Time: 21:37
 */

namespace App\Http;


use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table='user';

    protected $primaryKey='userid';

    protected $fillable=['username','useremail','userpass'];

    public $timestamps=false;
}