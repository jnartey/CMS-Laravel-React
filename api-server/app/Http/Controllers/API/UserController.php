<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\User;
use App\Role;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

use App\Http\Controllers\API\BaseController as BaseController;

class UserController extends BaseController
{
    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed'
        ]);
    }

    public function index()
    {
        //return User::all();
        return $this->sendResponse(User::with('roles')->get(), '');
    }

    public function show($id)
    {
        //return $user;
        return $this->sendResponse(User::find($id), '');
    }

    public function store(Request $request)
    {
        // $user = User::create($request->all());

        // return response()->json($user, 201);

        $validator = validator($request->all());


        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $role = Role::where('id', $input['role_id'])->first();
        $user = User::create($input);
        $user->roles()->attach($role);

        $success['token'] =  $user->createToken('FifthLightApp')->accessToken;
        $success['first_name'] =  $user->first_name;
        $success['last_name'] =  $user->last_name;
        $success['email'] =  $user->email;
        $success['username'] =  $user->username;
        $success['id'] =  $user->id;
        $success['role_id'] = $role;

        // After the user is created, he's logged in.
        //$this->guard()->login($user);

        return $this->sendResponse($success, 'User registered successfully.');
    }

    public function update(Request $request, User $user)
    {
        $user->update($request->all());

        return response()->json($user, 200);
    }

    public function getRoles(){
        return $this->sendResponse(Role::all(), '');
    }

    public function delete($id)
    {
        $user = User::find($id);
        //$role = Role::where('id', $id)->first();

        $success['first_name'] =  $user->first_name;
        $success['last_name'] =  $user->last_name;
        $success['email'] =  $user->email;
        $success['username'] =  $user->username;
        $success['id'] =  $user->id;
        //$success['role_id'] = $role;

        if($user->forceDelete()){
            return $this->sendResponse($success, 'User - '.$success['first_name'].' '.$success['last_name'].' deleted successfully.');
        }else{
            return $this->sendError('User - '.$success['first_name'].' '.$success['last_name'].' could not be deleted'); 
        }
    }

    public function bulkdelete($user_id_array)
    {
        $users = User::whereIn('id', $user_id_array);
        $success = true;

        if($users->forceDelete()){
            return $this->sendResponse($success, 'User deleted successfully.');
        }else{
            return $this->sendError('User could not be deleted'); 
        }
    }
}
