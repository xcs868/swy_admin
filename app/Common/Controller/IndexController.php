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

use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\RequestMapping;
use Mine\MineRequest;

#[Controller]
class IndexController
{
    #[RequestMapping('/', 'get,post')]
    public function index()
    {
        $request = container()->get(MineRequest::class);
        $method = $request->getMethod();
        logger()->info('test');
        return [
            'method' => $method,
            'query' => $request->getUri()->getQuery(),
            'app_name' => config('app_name'),
            'app_type' => config('app_type'),
            'environment' => environment(),
            'config' => [
                'scan_cacheable' => env('SCAN_CACHEABLE'),
                'apollo' => [
                    'APOLLO_CONFIG_SERVER' => env('APOLLO_CONFIG_SERVER'),
                    'APOLLO_APP_ID' => env('APOLLO_APP_ID'),
                    'APOLLO_NAMESPACES' => env('APOLLO_NAMESPACES'),
                    'APOLLO_CLUSTER' => env('APOLLO_CLUSTER'),
                ],
                'servers' => config('servers'),
                'services' => config('services'),
            ],
            'message' => 'RD Framework',
            'tips' => [
                'command: <composer watch> can start a local server ',
                'command: <composer cs-fix> can fix code format ',
                'command: <composer cs> can check code format ',
                'command: <composer test> can run phpunit test ',
                'command: <composer analyse> can analyse code',
            ],
        ];
    }
}
