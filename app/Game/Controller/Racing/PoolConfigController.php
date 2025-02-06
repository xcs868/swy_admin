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

namespace App\Game\Controller\Racing;

use App\Game\Service\RacingService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/racing')]
class PoolConfigController extends MineController
{
    #[Inject]
    protected RacingService $service;

    /**
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('pool-config/list')]
    public function list(): ResponseInterface
    {
        $serviceRet = $this->service->getPoolConf();
        return $this->success([
            'items' => $serviceRet['conf'] ?? [],
            'racing_pool_value' => $serviceRet['racing_pool_value'] ?? 0,
            'area_id' => $serviceRet['area_id'] ?? 0,
        ]);
    }

    /**
     * 更新数据.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[PutMapping('pool-config/update')]
    public function update(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all();
        $items = [];
        foreach ($postData['data'] as $key => $postDatum) {
            $items[] = [
                'id' => $key,
                'data' => $postDatum,
            ];
        }
        return $this->service->updatePoolConfig($items) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
