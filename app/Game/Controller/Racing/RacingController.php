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
use Hyperf\HttpServer\Annotation\DeleteMapping;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PostMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/racing')]
class RacingController extends MineController
{
    #[Inject]
    protected RacingService $service;

    /**
     * 本地模块列表.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('list')]
    public function list(): ResponseInterface
    {
        return $this->success($this->service->list());
    }

    /**
     * 读取数据.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('read/{id}')]
    public function read(int $id): ResponseInterface
    {
        return $this->success($this->service->read($id));
    }

    /**
     * 更新数据.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[PutMapping('update/{id}')]
    public function update(int $id, MineFormRequest $request): ResponseInterface
    {
        return $this->service->update((int) $id, $request->all()) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    /**
     * 新增本地模块.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[PostMapping('save')]
    public function save(MineFormRequest $request): ResponseInterface
    {
        $all = $request->all();
        $all['uid'] = 1;
        $all['status'] = 0;
        $all['type'] = 1;
        return $this->success($this->service->save($all));
    }

    /**
     * 发布.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[PutMapping('release')]
    public function release(MineFormRequest $request): ResponseInterface
    {
        $all = $request->all();
        $comboId = $all['id'];
        return $this->service->release((int) $comboId) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    /**
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     * @throws \Throwable
     */
    #[DeleteMapping('delete')]
    public function delete(): ResponseInterface
    {
        return $this->service->delete((array) $this->request->input('ids', [])) ? $this->success() : $this->error();
    }

    #[GetMapping('real-time-award')]
    public function realTimeAward()
    {
        return $this->success($this->service->realTimeAward());
    }

    #[GetMapping('real-time-award-cfg')]
    public function realTimeAwardCfg()
    {
        return $this->success($this->service->realTimeAward());
    }

    #[GetMapping('current-info')]
    public function getCurrentRoundInfo()
    {
        return $this->success($this->service->getCurrentRoundInfo());
    }

    #[GetMapping('cfg')]
    public function cfg()
    {
        return $this->success($this->service->cfg());
    }

    #[PutMapping('update-lottery-results')]
    public function updateLotteryResults(MineFormRequest $request)
    {
        $all = $request->all();
        $id = $all['id'];
        return $this->service->updateLotteryResults($id, $all) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
