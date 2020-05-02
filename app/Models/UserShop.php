<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserShop extends Model
{
    const PLAN_ACTIVE = 1;
    const PLAN_INACTIVE = 0;
    const PLAN_PANDING = 2;

    public static $planStatuses =
        [
            self::PLAN_INACTIVE => 'Inactive',
            self::PLAN_ACTIVE => 'Active',
            self::PLAN_PANDING => 'Pending'
        ];

    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function planStatus()
    {
        return self::$planStatuses[$this->is_active];
    }
}
