<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Session;

class DBController extends Controller
{
    public function export()
    {
        $path = public_path() . '/sqlBackup';
        File::isDirectory($path) or File::makeDirectory($path, 0777, true, true);

        $host = env('DB_HOST');
        $port = env('DB_PORT');
        $username = env('DB_USERNAME');
        $password = env('DB_PASSWORD');
        $database = env('DB_DATABASE');
        if (!$password) {
            return back()->with('error_db', 'db password must not be empty !');
        }

        //back the whole DB
        $filename = 'backups' . '.sql';
        $handle = fopen(public_path() . '/sqlBackup/' . $filename, 'w+');
        fwrite($handle, 'something');
        fclose($handle);

        $file = public_path() . '/sqlBackup/' . $filename;
        $command = 'mysqldump -h ' . $host . ' -P ' . $port . ' -u ' . $username . ' -p' . $password . '  ' . $database . ' > ' . $file;

        exec($command);
        $now = now()->format('Y_m_d H_i_s');
        rename($file, public_path() . '/sqlBackup/' . 'backup_' . $now   . '.sql');
        return response()->download(public_path() . '/sqlBackup/' . 'backup_' . $now   . '.sql');
    }
}
