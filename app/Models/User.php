<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Cashier\Billable;

/**
 * Class User
 * @property UserShop $userShop
 */
class User extends Authenticatable
{
    use Notifiable;

    const USER_ROLE_ADMIN = 1;
    const USER_ROLE_USER = 0;

    const USER_STATUS_ACTIVE = 1;
    const USER_STATUS_INACTIVE = 0;
    const USER_STATUS_DELETED = 2;


    public static $roles =
        [
            self::USER_ROLE_USER => 'User',
            self::USER_ROLE_ADMIN => 'Admin',
        ];

    public static $statuses =
        [
            self::USER_STATUS_ACTIVE => 'Active',
            self::USER_STATUS_INACTIVE => 'Inactive',
            self::USER_STATUS_DELETED => 'Deleted',
        ];


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function userShop()
    {
        return $this->hasOne(UserShop::class);
    }

    public function roleName()
    {
       return self::$roles[$this->role];
    }

    public function statusName()
    {
        return self::$statuses[$this->status];
    }
}
