<?php

namespace Database\Seeders;

use App\Models\Good;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * 运行数据库填充器
     *
     * @return void
     */
    public function run()
    {
        Good::factory()
            ->times(50)
            ->create();
    }

}
