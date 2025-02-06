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

class LuckTurntableService
{
    #[Inject]
    public GamesRepository $serviceRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    public function getOrdinary($configId)
    {
        return $this->serviceRepository->request('luck_turntable_smc/getOrdinary', [$configId])['data'] ?? [];
    }

    public function getConfig()
    {
        return $this->serviceRepository->request('luck_turntable_smc/getConfig')['data'] ?? [];
    }

    public function searchGiftId($configId)
    {
        return $this->serviceRepository->request('luck_turntable_smc/searchGiftId', [$configId]) ?? [];
    }

    public function getLuxury($configId)
    {
        return $this->serviceRepository->request('luck_turntable_smc/getLuxury', [$configId])['data'] ?? [];
    }

    public function updatePrizeId($prizeIndex, $giftId, $configIds)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luck_turntable_smc/updatePrizeId', [$prizeIndex, $giftId, $configIds]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function batchUpdatePrize($post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luck_turntable_smc/batchUpdatePrize', [$post]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function updateConfig($configid, $post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luck_turntable_smc/updateConfig', [$configid, $post]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }
}
