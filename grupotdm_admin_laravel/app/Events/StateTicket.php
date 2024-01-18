<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class StateTicket  implements ShouldBroadcast
{
    use Dispatchable, SerializesModels;

    public $ticket;

    /**
     * Create a new event instance.
     */
    public function __construct($ticket)
    {
        $this->ticket = $ticket;
    }

   /**
     * Get the channels the event should broadcast on.
     *
     * @return PresenceChannel
     */
    public function broadcastOn()
    {
        return new PresenceChannel("stateticket");
    }
}
