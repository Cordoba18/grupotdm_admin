<?php
//importaciones
namespace App\Http\Controllers;
use App\Http\Requests\ProfileUpdateRequest;
use App\Models\Message;
use App\Models\Payment_method;
use App\Models\Shop;
use App\Models\Tpv;
use Carbon\Carbon;
use DateTime;
use DateTimeZone;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use GuzzleHttp\Client;

//Declaracion de clase
class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
     public function index(){


        return view('dashboard');
     }
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }

    //funcion que me permite ver el perfil del usuario
public function show_profile(){
    $user = Auth::user();
    return redirect()->route('dashboard.users.edit_profile', $user->id);
}

//funcion que me permite general un codigo aleatorio de 6 digitos
public static function randNumer() {
    $d=rand(100000,999999);
    return $d;
}


}
