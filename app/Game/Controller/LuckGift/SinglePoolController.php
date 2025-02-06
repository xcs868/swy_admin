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

use App\Game\Service\LuckGiftSinglePoolService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/luck-gift/single-pool')]
class SinglePoolController extends MineController
{
    #[Inject]
    protected LuckGiftSinglePoolService $service;

    /**
     * 列表.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('list')]
    public function list(): ResponseInterface
    {
        return $this->success($this->service->getLuckGiftPoolCycle());
    }

    /**
     * 更新数据.
     */
    #[PutMapping('update')]
    public function mdfLuckGiftPoolCycle(MineFormRequest $request): ResponseInterface
    {
        $datas = $request->all() ?? [];
        $id = $datas['id'];
        $dark_tax_scale = $datas['dark_tax_scale'];
        $anchor_scale = $datas['anchor_scale'];
        $periodic_pattern = $datas['periodic_pattern'];
        $personal_level = $datas['personal_level'];
        $initial_no_win_weight = $datas['initial_no_win_weight'];
        $basic_control_coefficicent = $datas['basic_control_coefficicent'];
        $reser_gear_control_coefficient = $datas['reser_gear_control_coefficient'];
        $pool = $datas['pool'];

        return $this->service->mdfLuckGiftPoolCycle((int) $id, [
            'dark_tax_scale' => $dark_tax_scale,
            'anchor_scale' => $anchor_scale,
            'pool' => $pool,
            'periodic_pattern' => $periodic_pattern,
            'personal_level' => $personal_level,
            'initial_no_win_weight' => $initial_no_win_weight,
            'basic_control_coefficicent' => $basic_control_coefficicent,
            'reser_gear_control_coefficient' => $reser_gear_control_coefficient,
        ]) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
