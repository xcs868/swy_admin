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
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/racing/prize')]
class RacingPrizeController extends MineController
{
    #[Inject]
    protected RacingService $service;

    /**
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('list')]
    public function list(): ResponseInterface
    {
        $prizeId = $this->request->all()['prize'] ?? 0;
        return $this->success($this->service->prizes($prizeId));
    }

    /**
     * 更新数据.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[PutMapping('update')]
    public function update(): ResponseInterface
    {
        $prizeId = $this->request->all()['prize_id'] ?? 0;
        return $this->service->updatePrize($prizeId, $this->request->all()) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
