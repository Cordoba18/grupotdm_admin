<?php

use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('createticket', function ($user){

        return $user;

});


Broadcast::channel('stateticket', function ($user){
    return $user;

});

Broadcast::channel('commentticket.{id_ticket}', function ($user, $id_ticket){
    if  (DB::selectOne("SELECT * FROM tickets WHERE id=$id_ticket AND (id_user_sender = $user->id || id_user_destination = $user->id)")){
        return $user;
    }

});

Broadcast::channel('writtingcomment.{id_ticket}', function ($user, $id_ticket){
    if  (DB::selectOne("SELECT * FROM tickets WHERE id=$id_ticket AND (id_user_sender = $user->id || id_user_destination = $user->id)")){
        return $user;
    }

});

Broadcast::channel('deletecomment.{id_ticket}', function ($user, $id_ticket){
    if  (DB::selectOne("SELECT * FROM tickets WHERE id=$id_ticket AND (id_user_sender = $user->id || id_user_destination = $user->id)")){
        return $user;
    }

});
