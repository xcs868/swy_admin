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
class CycleController extends MineController
{
    #[Inject]
    protected RacingService $service;

    /**
     * 本地模块列表.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('cycle/list')]
    public function list(): ResponseInterface
    {
        return $this->success($this->service->getCycle());
    }

    /**
     * 更新数据.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[PutMapping('cycle/update/{id}')]
    public function update(int $id, MineFormRequest $request): ResponseInterface
    {
        return $this->service->updateCycle((int) $id, $request->all()) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
