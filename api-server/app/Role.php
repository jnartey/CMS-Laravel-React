<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    //creating relations between roles and user (roles belongs to many users)
    public function users(){
        return $this->belongsToMany('App\User', 'user_role', 'role_id', 'user_id');
    }
}
