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

namespace App\Game\Controller\LuckTurntable;

use App\Game\Service\LuckTurntableService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/luck-turntable')]
class GiftController extends MineController
{
    #[Inject]
    protected LuckTurntableService $service;

    #[GetMapping('high/list')]
    public function high(MineFormRequest $request): ResponseInterface
    {
        $all = $request->all() ?? [];
        $configId = $all['config_id'] ?? 4;
        $ret = $this->service->getLuxury($configId);
        $data = $ret;
        $data['configid'] = $configId;
        return $this->success($data);
    }

    #[GetMapping('list')]
    public function getOrdinary(MineFormRequest $request): ResponseInterface
    {
        $all = $request->all() ?? [];
        $configId = $all['config_id'] ?? 1;

        $res = $this->service->getOrdinary($configId);
        $data = $res;
        $data['configid'] = $configId;
        return $this->success($data);
    }

    #[GetMapping('search-gift-id')]
    public function searchGiftId(MineFormRequest $request): ResponseInterface
    {
        $all = $request->all() ?? [];
        $giftId = $all['gift_id'] ?? 0;

        if (empty($giftId)) {
            return $this->error('礼物标识为空');
        }

        $serviceRet = $this->service->searchGiftId($giftId);

        if ($serviceRet['code'] != 1) {
            return $this->error($serviceRet['msg'] ?? '');
        }

        return $this->success($serviceRet['data']);
    }

    #[GetMapping('edit-gift-id')]
    public function editPrizeId(MineFormRequest $request): ResponseInterface
    {
        $all = $request->all() ?? [];
        $giftId = $all['gift_id'] ?? 0;

        if (empty($giftId)) {
            return $this->error('礼物标识为空');
        }
        $prizeIndex = (int) $all['prize_index'];
        $configIds = (array) $all['config_ids'];
        return $this->service->updatePrizeId($prizeIndex, $giftId, $configIds) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('batch-update-property')]
    public function batchUpdateProperty(MineFormRequest $request)
    {
        $all = $request->all();
        $configid = $all['configid'];
        $datas = $all['datas'];

        if (in_array($configid, [1, 2, 3])) {
            $ret = $this->service->getOrdinary($configid);
        } elseif (in_array($configid, [4, 5, 6])) {
            $ret = $this->service->getLuxury($configid);
        }
        $update = [];
        foreach ($ret['info_prizes'] as $_row) {
            $_update['id'] = $_row['id'];
            if (isset($datas[$_row['id']]['normal'])) {
                $_update['normal'] = $datas[$_row['id']]['normal'];
            }
            if (isset($datas[$_row['id']]['draft_normal'])) {
                $_update['draft_normal'] = $datas[$_row['id']]['draft_normal'];
            }
            if (isset($datas[$_row['id']]['draft_bi_zhong'])) {
                $_update['draft_bi_zhong'] = $datas[$_row['id']]['draft_bi_zhong'];
            }
            if (isset($datas[$_row['id']]['normal_bi_zhong'])) {
                $_update['normal_bi_zhong'] = $datas[$_row['id']]['normal_bi_zhong'];
            }
            if (isset($datas[$_row['id']]['background_color'])) {
                $_update['background_color'] = $datas[$_row['id']]['background_color'];
            }
            if (isset($datas[$_row['id']]['is_all_room_screen_value'])) {
                $_update['is_all_room_screen_value'] = $datas[$_row['id']]['is_all_room_screen_value'];
            }
            if (isset($datas[$_row['id']]['is_all_screen_value'])) {
                $_update['is_all_screen_value'] = $datas[$_row['id']]['is_all_screen_value'];
            }
            if (isset($datas[$_row['id']]['sort'])) {
                $_update['sort'] = $datas[$_row['id']]['sort'];
            }
            if (isset($datas[$_row['id']]['is_room_screen_value'])) {
                $_update['is_room_screen_value'] = $datas[$_row['id']]['is_room_screen_value'];
            }
            if (isset($datas[$_row['id']]['prize_a_normal_bi_zhong'])) {
                $_update['prize_a_normal_bi_zhong'] = $datas[$_row['id']]['prize_a_normal_bi_zhong'];
            }
            if (isset($datas[$_row['id']]['prize_a_normal'])) {
                $_update['prize_a_normal'] = $datas[$_row['id']]['prize_a_normal'];
            }
            if (isset($datas[$_row['id']]['prize_a_draft_bi_zhong'])) {
                $_update['prize_a_draft_bi_zhong'] = $datas[$_row['id']]['prize_a_draft_bi_zhong'];
            }
            if (isset($datas[$_row['id']]['prize_a_draft_normal'])) {
                $_update['prize_a_draft_normal'] = $datas[$_row['id']]['prize_a_draft_normal'];
            }
            if (isset($datas[$_row['id']]['prize_b_normal_bi_zhong'])) {
                $_update['prize_b_normal_bi_zhong'] = $datas[$_row['id']]['prize_b_normal_bi_zhong'];
            }
            if (isset($datas[$_row['id']]['prize_b_normal'])) {
                $_update['prize_b_normal'] = $datas[$_row['id']]['prize_b_normal'];
            }
            if (isset($datas[$_row['id']]['prize_b_draft_bi_zhong'])) {
                $_update['prize_b_draft_bi_zhong'] = $datas[$_row['id']]['prize_b_draft_bi_zhong'];
            }
            if (isset($datas[$_row['id']]['prize_b_draft_normal'])) {
                $_update['prize_b_draft_normal'] = $datas[$_row['id']]['prize_b_draft_normal'];
            }
            if (isset($datas[$_row['id']]['grand_prize_normal_bi_zhong'])) {
                $_update['grand_prize_normal_bi_zhong'] = $datas[$_row['id']]['grand_prize_normal_bi_zhong'];
            }
            if (isset($datas[$_row['id']]['grand_prize_normal'])) {
                $_update['grand_prize_normal'] = $datas[$_row['id']]['grand_prize_normal'];
            }
            if (isset($datas[$_row['id']]['grand_prize_draft_bi_zhong'])) {
                $_update['grand_prize_draft_bi_zhong'] = $datas[$_row['id']]['grand_prize_draft_bi_zhong'];
            }
            if (isset($datas[$_row['id']]['grand_prize_draft'])) {
                $_update['grand_prize_draft'] = $datas[$_row['id']]['grand_prize_draft'];
            }
            if (isset($datas[$_row['id']]['displa_probability'])) {
                $_update['displa_probability'] = $datas[$_row['id']]['displa_probability'];
            }
            $update[] = $_update;
        }
        return $this->service->batchUpdatePrize($update) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('ordinary')]
    public function ordinary(MineFormRequest $request)
    {
        $all = $request->all();
        $configid = $all['configid'];

        $platform_scale = $all['platform_scale'];
        $ordinary_spit_thread_conf_min = $all['ordinary_spit_thread_conf_min'] ?? 0;
        $ordinary_normal_conf_min = $all['ordinary_normal_conf_min'];
        $ordinary_normal_conf_max = $all['ordinary_normal_conf_max'];
        $ordinary_eat_thread_conf_min = $all['ordinary_eat_thread_conf_min'];
        $ordinary_eat_thread_conf_max = $all['ordinary_eat_thread_conf_max'];
        $ret = [];
        if (in_array($configid, [1, 2, 3])) {
            $ret = $this->service->getOrdinary($configid);
        } elseif (in_array($configid, [4, 5, 6])) {
            $ret = $this->service->getLuxury($configid);
        }
        $ordinary_spit_thread_conf = $ret['ordinary_spit_thread_conf'];
        $ordinary_spit_thread_conf['min'] = $ordinary_spit_thread_conf_min;
        $ordinary_normal_conf = $ret['ordinary_normal_conf'];
        $ordinary_normal_conf['min'] = $ordinary_normal_conf_min;
        $ordinary_normal_conf['max'] = $ordinary_normal_conf_max;
        $ordinary_eat_thread_conf = $ret['ordinary_eat_thread_conf'];
        $ordinary_eat_thread_conf['min'] = $ordinary_eat_thread_conf_min;
        $ordinary_eat_thread_conf['max'] = $ordinary_eat_thread_conf_max;
        return $this->service->updateConfig($configid, [
            'platform_scale' => $platform_scale,
            'ordinary_spit_thread_conf' => json_encode($ordinary_spit_thread_conf),
            'ordinary_normal_conf' => json_encode($ordinary_normal_conf),
            'ordinary_eat_thread_conf' => json_encode($ordinary_eat_thread_conf),
        ]) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
