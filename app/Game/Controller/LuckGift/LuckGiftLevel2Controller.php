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

/**
 * Class RacingController.
 */
#[Controller(prefix: 'game/luck-gift/level2')]
class LuckGiftLevel2Controller extends MineController
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
        return $this->success($this->service->getLevel2LuckGift());
    }

    /**
     * 更新数据.
     */
    #[PutMapping('update')]
    public function mdfPoolCfg(MineFormRequest $request): ResponseInterface
    {
        $datas = $request->all()['datas'] ?? [];
        $list = $this->service->getLevel2LuckGift()['list'] ?? [];

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
            if (isset($datas[$_row['id']]['special_bei'])) {
                $_update['special_bei'] = $datas[$_row['id']]['special_bei'];
            }
            if (isset($datas[$_row['id']]['special_expect'])) {
                $_update['special_expect'] = $datas[$_row['id']]['special_expect'];
            }
            if (isset($datas[$_row['id']]['per_send_num'])) {
                $_update['per_send_num'] = $datas[$_row['id']]['per_send_num'];
            }
            if (isset($datas[$_row['id']]['combo_num'])) {
                $_update['combo_num'] = $datas[$_row['id']]['combo_num'];
            }
            $update[] = $_update;
        }

        return $this->service->batchUpdatePrize($update) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
