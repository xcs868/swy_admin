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

namespace App\Game\Service;

use App\Game\Repository\GamesRepository;
use Hyperf\Di\Annotation\Inject;

/**
 * 数据源管理服务类.
 */
class RacingService
{
    #[Inject]
    public GamesRepository $serviceGamesRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    // 套餐列表
    public function list()
    {
        return $this->serviceGamesRepository->request('racing_combo/getRacingCombos', [0])['data'] ?? [];
    }

    public function getCycle()
    {
        return $this->serviceGamesRepository->request('racing_combo/getcycle', [0])['data'] ?? [];
    }

    public function updateCycle($id, $post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('racing_combo/updateCycle', [$post, $id]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function getPoolConf()
    {
        return $this->serviceGamesRepository->request('racing_combo/getPoolConf', [])['data'] ?? [];
    }

    public function updatePoolConfig($items)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('racing_combo/updatePoolConf', [$items]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function getCurrentRoundInfo()
    {
        return $this->serviceGamesRepository->request('racing/getCurrentRoundInfo', [])['data'] ?? [];
    }

    public function realTimeAward()
    {
        return $this->serviceGamesRepository->request('racing/realTimeAward', [])['data'] ?? [];
    }

    public function prizes($id)
    {
        return $this->serviceGamesRepository->request('racing_combo/cfg',[$id])['data']['prize'] ?? [];
    }

    public function cfg()
    {
        return $this->serviceGamesRepository->request('racing/cfg', [])['data'] ?? [];
    }

    // 套餐详情
    public function read($id)
    {
        return $this->serviceGamesRepository->request('racing_combo/getRacingComboInfoById', [$id])['data']['data'] ?? [];
    }

    public function update($id, $data)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('racing_combo/updateCombo', [$id, $data]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function updatePrize($racingComboPrizeId, $data)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('racing_combo/updatePrize', [$racingComboPrizeId, $data]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function save($data)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('racing_combo/addCombo', [$data]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return [];
        }
        return $serviceRet['data'] ?? [];
    }

    public function release($id)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('racing_combo/release', [(int) $id]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function updateLotteryResults($id, $postData)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('racing/updateLotteryResults', [$id, $postData]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function delete($ids)
    {
        $this->errMsg = '';
        foreach ($ids as $id) {
            $serviceRet = $this->serviceGamesRepository->request('racing_combo/del', [(int) $id]) ?? [];
            if ($serviceRet['code'] != 1) {
                $this->errMsg = $serviceRet['msg'] ?? '';
                return false;
            }
        }
        return true;
    }
}
