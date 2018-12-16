<?php

namespace App\Http\Controllers\API;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Carbon\Carbon;

use App\Http\Controllers\API\BaseController as BaseController;

class LoginController extends BaseController
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    //protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
            'remember_me' => 'boolean'
        ]);
    }

    // public function username()
    // {
    //     return 'username';
    // }

    /**public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string|confirmed',
            'remember_me' => 'boolean'
        ]);

        $credentials = request(['email', 'password']);

        if(!Auth::attempt($credentials)){
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);

            //return $this->sendError('Validation Error.', $validator->errors());
        }

        $user = Auth::user();
        $token = $user->createToken('FifthLightApp')->accessToken;

        if ($request->remember_me){
            $token->expires_at = Carbon::now()->addWeeks(4);
        }
        
        $token->save();
        
        $success['token'] = $user->createToken('FifthLightApp')->accessToken;
        //$success['token_type'] = 'Bearer';
        $success['expires_at'] = Carbon::parse($token->token->expires_at)->toDateTimeString();

        return $this->sendResponse($success, 'Login successful.');
    }**/

    public function login(){ 
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){ 
            $user = Auth::user();

            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->token;

            if (request('remember_me')){
                $token->expires_at = Carbon::now()->addWeeks(12);
            }
            
            $token->save();
            
            $success['id'] =  $user->id;
            $success['first_name'] =  $user->first_name;
            $success['last_name'] =  $user->last_name;
            $success['email'] =  $user->email;
            $success['username'] =  $user->username;
            $success['token'] = $tokenResult->accessToken;
            //$success['token_type'] = 'Bearer';
            $success['expires_at'] = Carbon::parse($tokenResult->token->expires_at)->toDateTimeString();
    
            return $this->sendResponse($success, 'Login successful.');
        }else{ 
            //return response()->json(['error'=>'Unauthorised'], 401); 
            return $this->sendError('Wrong Username or password.'); 
        } 
    }
  
    /**
     * Logout user (Revoke the token)
     *
     * @return [string] message
     */
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }
  
    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function user(Request $request)
    {
        return response()->json($request->user());
    }

}
