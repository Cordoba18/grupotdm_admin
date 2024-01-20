<?php

namespace App\Http\Controllers;

use App\Mail\new_file;
use App\Mail\new_repository;
use App\Models\Directorie;
use App\Models\Files_modified;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\File;
use App\Models\File as ModelsFile;
class DirectoriesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function show_directories(){

        $user = Auth::user();
        $directories = DB::select("SELECT d.code, d.id, d.name, d.directory, d.date_create, d.date_update, u.id AS id_user , u.name AS name_user, s.state, s.id AS id_state
        FROM directories d
        INNER JOIN users u ON d.id_user = u.id
        INNER JOIN areas a ON u.id_area = a.id
        INNER JOIN states s ON d.id_state = s.id
        WHERE a.id = $user->id_area AND d.id_state = 1 ORDER BY d.id DESC");

    return view("dashboard.directories.directories",compact('user', 'directories'));


    }

    public function show_directories_search(Request $request){
        $user = Auth::user();
        $search = $request->search;
        $directories = DB::select("SELECT d.code, d.id, d.name, d.directory, d.date_create, d.date_update, u.id AS id_user , u.name AS name_user, s.state, s.id AS id_state
        FROM directories d
        INNER JOIN users u ON d.id_user = u.id
        INNER JOIN areas a ON u.id_area = a.id
        INNER JOIN states s ON d.id_state = s.id
        WHERE a.id = $user->id_area AND d.id_state = 1
        AND (d.id LIKE '%$search%' OR d.name LIKE '%$search%' OR d.date_create LIKE '%$search%' OR u.name LIKE '%$search%')
        ORDER BY d.id DESC");

    return view("dashboard.directories.directories",compact('user', 'directories'));
    }


public function create_repository(){
    return view("dashboard.directories.create");
}

public function save_directory(Request $request){
    $user = Auth::user();
    $directorie = new Directorie();

    $fechaActual = Carbon::now('America/Bogota');
$fechaColombiana = $fechaActual->format('d-m-Y H-i-s');
$code = ProfileController::randNumer();

    $ruta = public_path('storage/files/'.$fechaColombiana."/".$user->id);
    if (!File::exists($ruta)) {
        File::makeDirectory($ruta, 0777, true, true);

        $directorie->name = $request->name;
        $directorie->code = $code;
        $directorie->directory = $fechaColombiana."/".$user->id;
        $directorie->date_create =$fechaColombiana;
        $directorie->date_update =$fechaColombiana;
        $directorie->id_user =$user->id;
        $directorie->id_state =1;
        Mail::to($user->email)->send(new new_repository($user, $directorie));
        ReportController::create_report("Se ha creado un nuevo repositorio con llamado $request->name", $user->id, 12);
        $directorie->save();

        return redirect()->route('dashboard.directories')->with('message','Directorio creado correctamente');

}

}

public function view_directory(Request $request){

    $user = Auth::user();
    $id =  $request->id;
    $files = DB::select("SELECT f.id, f.file, f.name, f.date_create, f.date_update, f.id_directory, s.state, f.id_state, u.id AS id_user, u.name AS name_user, d.directory, d.id_user AS id_user_directory
    FROM files f
    INNER JOIN users u ON f.id_user = u.id
    INNER JOIN directories d ON f.id_directory = d.id
    INNER JOIN states s ON f.id_state = s.id WHERE d.id = $id AND f.id_state = 1 ORDER BY f.id DESC");
    return view('dashboard.directories.files.files', compact('files', 'user', 'id'));

}

public function view_directory_search(Request $request){
    $user = Auth::user();
    $id =  $request->id;
    $search =  $request->search;
    $files = DB::select("SELECT f.id, f.file, f.name, f.date_create, f.date_update, f.id_directory, s.state, f.id_state, u.id AS id_user, u.name AS name_user, d.directory, d.id_user AS id_user_directory
    FROM files f
    INNER JOIN users u ON f.id_user = u.id
    INNER JOIN directories d ON f.id_directory = d.id
    INNER JOIN states s ON f.id_state = s.id WHERE d.id = $id AND f.id_state = 1 AND (u.name LIKE '%$search%' OR d.name LIKE '%$search%' OR f.name LIKE '%$search%' OR f.id LIKE '%$search%') ORDER BY f.id DESC");
    return view('dashboard.directories.files.files', compact('files', 'user', 'id'));
}


public function delete_directory(Request $request){

    $id_directory = $request->id_directory;
    $directory = Directorie::find($id_directory);
    $directory->id_state = 2;
    $user = Auth::user();
    ReportController::create_report("Se ha eliminado un directorio llamado $directory->name con ID $id_directory", $user->id, 13);
    $directory->save();

    return back()->with('message','Directorio eliminado con exito');
}
public function delete_file(Request $request){

    $id_file = $request->id_file;
    $file = ModelsFile::find($id_file);
    $file->id_state = 2;
    $user = Auth::user();
    ReportController::create_report("Se ha eliminado un archivo llamado $file->name con ID $id_file", $user->id, 16);
    $file->save();
    return back()->with('message','Archivo eliminado con exito');
}


public function create_file($id_directory){

    return view('dashboard.directories.files.create_file',compact('id_directory'));
}

public function save_file(Request $request){

    $user = Auth::user();
    $new_file = new ModelsFile();
    $id_directory = $request->id_directory;
    $fechaActual = Carbon::now('America/Bogota');
    $fechaColombiana = $fechaActual->format('d-m-Y H-i-s');
    $directory = DB::selectOne("SELECT * FROM directories WHERE id=$id_directory AND code=$request->code");
    if ($directory) {
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fechaHoraActual = now()->format('Y-m-d_H-i-s');
            $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
            $rutaImagen = public_path('storage/files/'.$directory->directory.'/'. $name_file);
            $file->move(public_path('storage/files/'.$directory->directory), $name_file);
            $new_file->name = $request->name;
            $new_file->file = $name_file;
            $new_file->id_directory = $id_directory;
            $new_file->id_state = 1;
            $new_file->id_user = $user->id;
            $new_file->date_create = $fechaColombiana;
            $new_file->date_update = $fechaColombiana;
            ReportController::create_report("Se ha creado un nuevo archivo con llamado $request->name en el directorio con ID $directory->id", $user->id, 14);
            $new_file->save();
            Mail::to($user->email)->send(new new_file($user, $directory, $new_file));
            return back()->with('message','Archivo creado con exito');
        }
    }else{
        return redirect()->route('dashboard.create_file', $id_directory)->with('message','Codigo de directorio incorrecto');
    }


}

public function view_file(Request $request){

    $id_directory = $request->id_directory;
    $id_file = $request->id_file;
    $directorie = Directorie::find($id_directory);
    $files_modified = DB::select("SELECT fm.id, fm.name, fm.file, fm.date_update, fm.id_file, u.id AS id_user, u.name AS name_user FROM files_modified fm
    INNER JOIN users u ON fm.id_user = u.id
    WHERE fm.id_file = $id_file ORDER BY fm.id DESC");
    $file = DB::selectOne("SELECT * FROM files WHERE id = $id_file");
    return  view('dashboard.directories.files.view_file',compact('directorie','files_modified','file'));
}


public function edit_file(Request $request){
    $user = Auth::user();

    $table_file = ModelsFile::find($request->id_file);
    $id_directory = $request->id_directory;
    $directory = Directorie::where('id', $id_directory)
    ->where('code', $request->code)
    ->first();

    $file_modified = new Files_modified();
    $fechaActual = Carbon::now('America/Bogota');
    $fechaColombiana = $fechaActual->format('d-m-Y H-i-s');

    if ($directory) {
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fechaHoraActual = now()->format('Y-m-d_H-i-s');
            $name_file = $fechaHoraActual . '.' . $file->getClientOriginalExtension();
            $rutaImagen = public_path('storage/files/'.$directory->directory.'/'. $name_file);
            $file->move(public_path('storage/files/'.$directory->directory), $name_file);
            $file_modified->file = $table_file->file;
            $table_file->file = $name_file;
        }else{
            $file_modified->file = $table_file->file;
        }
        $file_modified->name = $table_file->name;
        $file_modified->date_update = $table_file->date_update;
        $file_modified->id_file = $table_file->id;
        $file_modified->id_user = $table_file->id_user;

        $table_file->name = $request->name;
        $table_file->date_update =$fechaColombiana;
        $table_file->id_user = $user->id;

        $directory->date_update =$fechaColombiana;


        $table_file->save();
        $file_modified->save();
        $directory->save();

        return back()->with('message','Cambios guardados con exito!');
    }else{
        return back()->with('message_error','Codigo de directorio incorrecto');
    }

    }

}
