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

namespace App\Game\Controller\LuckGift;

use App\Game\Service\LuckGiftBasicCfgService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/luck-gift/level3')]
class LuckGiftLevel3Controller extends MineController
{
    #[Inject]
    protected LuckGiftBasicCfgService $service;

    /**
     * 列表.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('list')]
    public function list(): ResponseInterface
    {
        $datas = $this->service->getLevel3LuckGift();
        return $this->success([
            'items' => $datas['list'] ?? [],
            'poolsize' => $datas['poolsize'] ?? 0,
        ]);
    }

    /**
     * 更新数据.
     */
    #[PutMapping('update')]
    public function mdfPoolCfg(MineFormRequest $request): ResponseInterface
    {
        $datas = $request->all()['datas'] ?? [];
        $list = $this->service->getLevel3LuckGift()['list'] ?? [];
        $update = [];
        foreach ($list as $_row) {
            $_update['id'] = $_row['id'];
            if (isset($datas[$_row['id']]['normal_bei'])) {
                $_update['normal_bei'] = $datas[$_row['id']]['normal_bei'];
            }
            if (isset($datas[$_row['id']]['normal_expect'])) {
                $_update['normal_expect'] = $datas[$_row['id']]['normal_expect'];
            }
            if (isset($datas[$_row['id']]['high_bei'])) {
                $_update['high_bei'] = $datas[$_row['id']]['high_bei'];
            }
            if (isset($datas[$_row['id']]['high_expect'])) {
                $_update['high_expect'] = $datas[$_row['id']]['high_expect'];
            }
            if (isset($datas[$_row['id']]['low_bei'])) {
                $_update['low_bei'] = $datas[$_row['id']]['low_bei'];
            }
            if (isset($datas[$_row['id']]['low_expect'])) {
                $_update['low_expect'] = $datas[$_row['id']]['low_expect'];
            }
            $update[] = $_update;
        }

        return $this->service->batchUpdatePrize3($update) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
