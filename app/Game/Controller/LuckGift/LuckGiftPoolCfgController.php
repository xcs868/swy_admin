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
#[Controller(prefix: 'game/luck-gift/pool-cfg')]
class LuckGiftPoolCfgController extends MineController
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
     * 更新数据.
     */
    #[PutMapping('update/{id}')]
    public function mdfPoolCfg(int $id, MineFormRequest $request): ResponseInterface
    {
        $request = $request->all();
        $list = $this->service->list();
        $ordinary_normal_conf_min = $request['ordinary_normal_conf_min'];
        $ordinary_limit_thread_conf_min = $request['ordinary_limit_thread_conf_min'];
        $ordinary_normal_conf_max = $request['ordinary_normal_conf_max'];
        $anchor_scale = $request['anchor_scale'];
        $platform_scale = $request['platform_scale'];
        $ordinary_jackpot_scale = $request['ordinary_jackpot_scale'];
        $common_jackpot_scale = $request['common_jackpot_scale'];
        $personal_jackpot_scale = $request['personal_jackpot_scale'];
        $id = $request['id'];
        if (($anchor_scale + $platform_scale + $ordinary_jackpot_scale + $common_jackpot_scale + $personal_jackpot_scale) != 100) {
            return $this->error('操作失败,值加起来不等于100');
        }

        $data = [];
        $data['anchor_scale'] = $anchor_scale;
        $data['platform_scale'] = $platform_scale;
        $data['ordinary_jackpot_scale'] = $ordinary_jackpot_scale;
        $data['common_jackpot_scale'] = $common_jackpot_scale;
        $data['personal_jackpot_scale'] = $personal_jackpot_scale;
        foreach ($list as $item) {
            if ($item['id'] == $id) {
                $ordinary_normal_conf = json_decode($item['ordinary_normal_conf'], true);
                $ordinary_normal_conf['min'] = $ordinary_normal_conf_min;
                $ordinary_normal_conf['max'] = $ordinary_normal_conf_max;
                $data['ordinary_normal_conf'] = json_encode($ordinary_normal_conf);

                $ordinary_eat_thread_conf = json_decode($item['ordinary_eat_thread_conf'], true);
                $ordinary_eat_thread_conf['max'] = $ordinary_normal_conf_min;
                $data['ordinary_eat_thread_conf'] = json_encode($ordinary_eat_thread_conf);

                $ordinary_spit_thread_conf = json_decode($item['ordinary_spit_thread_conf'], true);
                $ordinary_spit_thread_conf['min'] = $ordinary_normal_conf_max;
                $data['ordinary_spit_thread_conf'] = json_encode($ordinary_spit_thread_conf);

                $ordinary_limit_thread_conf = json_decode($item['ordinary_limit_thread_conf'], true);
                $ordinary_limit_thread_conf['min'] = $ordinary_limit_thread_conf_min;
                $data['ordinary_limit_thread_conf'] = json_encode($ordinary_limit_thread_conf);
            }
        }

        return $this->service->mdfBasicCfg($id, $data) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
