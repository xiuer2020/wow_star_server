<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $flights = App\Models\Flight::all();

        foreach ($flights as $flight) {
            echo $flight->name;
        }
    }
}
