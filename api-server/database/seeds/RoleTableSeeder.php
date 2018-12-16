<?php

use Illuminate\Database\Seeder;
use App\Role;

class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role_admin = new Role();
        $role_admin->name = 'Administrator';
        $role_admin->description = 'User with all privileges';
        $role_admin->save();

        $role_editor = new Role();
        $role_editor->name = 'Editor';
        $role_editor->description = 'User with some privileges';
        $role_editor->save();

        $role_user = new Role();
        $role_user->name = 'User';
        $role_user->description = 'Normal user for general web app functions';
        $role_user->save();
    }
}
