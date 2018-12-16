<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Role;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role_admin = Role::where('name', 'Administrator')->first();
        $role_editor = Role::where('name', 'Editor')->first();
        $role_user = Role::where('name', 'User')->first();

        $admin = new User();
        $admin->first_name = 'User';
        $admin->last_name = 'Admin';
        $admin->username = 'admin';
        $admin->email = 'jacob@gmail.com';
        $admin->password = bcrypt('$$5thlight');
        $admin->save();
        $admin->roles()->attach($role_admin);

        $user_1 = new User();
        $user_1->first_name = 'User';
        $user_1->last_name = 'Editor';
        $user_1->username = 'editor';
        $user_1->email = 'jnartey@gmail.com';
        $user_1->password = bcrypt('12345678');
        $user_1->save();
        $user_1->roles()->attach($role_editor);

        $user_2 = new User();
        $user_2->first_name = 'User';
        $user_2->last_name = 'User';
        $user_2->username = 'user';
        $user_2->email = 'jacobtt@hotmail.com';
        $user_2->password = bcrypt('12345678');
        $user_2->save();
        $user_2->roles()->attach($role_user);

        $user_3 = new User();
        $user_3->first_name = 'User';
        $user_3->last_name = 'Client';
        $user_3->username = 'client';
        $user_3->email = 'info@gmail.com';
        $user_3->password = bcrypt('12345678');
        $user_3->save();
        $user_3->roles()->attach($role_user);

        $user_4 = new User();
        $user_4->first_name = 'User';
        $user_4->last_name = 'Guest';
        $user_4->username = 'guest';
        $user_4->email = 'guest@gmail.com';
        $user_4->password = bcrypt('12345678');
        $user_4->save();
        $user_4->roles()->attach($role_user);
    }
}