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
 * 赛车游戏模块
 * Class RacingController.
 */
#[Controller(prefix: 'game/luck-gift/basic-cfg')]
class LuckGiftBasicCfgController extends MineController
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
        return $this->success($this->service->list());
    }

    /**
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('merge-configs')]
    public function getLuckGiftMergeConfigs(): ResponseInterface
    {
        $luckGiftMergeConfigs = $this->service->getLuckGiftMergeConfigs();
        $dataList = [];
        foreach ($luckGiftMergeConfigs as $luckGiftMergeConfig) {
            $dataList[] = $luckGiftMergeConfig;
        }
        return $this->success($dataList);
    }

    /**
     * 更新数据.
     */
    #[PutMapping('mdf-basic-cfg/{id}')]
    public function mdfBasicCfg(int $id, MineFormRequest $request): ResponseInterface
    {
        $requestAll = $request->all();
        $common_burst_point = $requestAll['common_burst_point'];
        $common_denominator = $requestAll['common_denominator'];
        $personal_burst_point = $requestAll['personal_burst_point'];
        $init_ordinary_jackpot = $requestAll['init_ordinary_jackpot'];
        return $this->service->mdfBasicCfg((int) $id, [
            'common_burst_point' => $common_burst_point,
            'common_denominator' => $common_denominator,
            'personal_burst_point' => $personal_burst_point,
            'init_ordinary_jackpot' => $init_ordinary_jackpot,
        ]) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('mdf-basic-cfg2/{id}')]
    public function mdfBasicCfg2(int $id, MineFormRequest $request): ResponseInterface
    {
        $requestAll = $request->all();
        $config_amount = $requestAll['config_amount'];
        $config_count = $requestAll['config_count'];
        return $this->service->updateLuckGiftMergeConfigs((int) $id, [
            'amount' => $config_amount,
            'count' => $config_count,
        ]) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
