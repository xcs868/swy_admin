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

namespace App\Game\Controller\Manage;

use App\Game\Service\ManageService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/manage/open')]
class OpenController extends MineController
{
    #[Inject]
    protected ManageService $service;

    #[GetMapping('list')]
    public function openManage(MineFormRequest $request): ResponseInterface
    {
        return $this->success($this->service->openManage());
    }

    /**
     * 更新数据.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[PutMapping('update')]
    public function changeArea(MineFormRequest $request)
    {
        $all = $request->all();
        $id = (int) trim($all['id']);
        $area = $all['area'];
        $isOpen = (int) trim($all['isCheck']);
        return $this->service->changeArea($id, $area, $isOpen) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
