<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class Delete_Comment  implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $comment;
public $user;
    /**
     * Create a new event instance.
     */
    public function __construct($comment, $user)
    {
        $this->comment = $comment;
        $this->user = $user;
    }

    /**
     * Get the channels the event should broadcast on.
     *
      * @return array<int, \Illuminate\Broadcasting\Channel>
     */
    public function broadcastOn()
    {
        return new PresenceChannel("deletecomment." . $this->comment->id_ticket);
    }
}
