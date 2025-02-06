<?php

declare(strict_types=1);
/**
 * This file is part of MineAdmin.
 *
 * @link     https://www.mineadmin.com
 * @document https://doc.mineadmin.com
 * @contact  root@imoi.cn
 * @license  https://github.com/mineadmin/MineAdmin/blob/master/LICENSE
 */

namespace App\Common\Controller;

use Carbon\Carbon;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;

/**
 * @Controller
 * @SuppressWarnings(PHPMD)
 */
#[Controller]
class HealthzController
{
    #[GetMapping('/healthz')]
    public function show()
    {
        return [
            'config_service' => 'health',
            'redis_service' => 'health',
            'mysql_service' => 'health',
            'time' => [
                'time_zone' => [
                    'default' => date_default_timezone_get(),
                    'carbon' => Carbon::now()->getTimezone(),
                ],
                'UTC' => Carbon::now('UTC')->toW3cString(),
                'Asia/Shanghai' => Carbon::now('Asia/Shanghai')->toW3cString(),
            ],
            'context' => [],
        ];
    }
}
