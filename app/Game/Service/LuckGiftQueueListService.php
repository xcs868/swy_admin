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

class LuckGiftQueueListService
{
    #[Inject]
    public GamesRepository $serviceRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    public function list()
    {
        return $this->serviceRepository->request('luck_gift_queue/getList')['data']['list'] ?? [];
    }

    public function save($giftId)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luck_gift_queue/addGift', [$giftId]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function editQueue($configId, $editQueue)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luck_gift_queue/editQueue', [$configId, $editQueue]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function putAway($id, $queueState)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luck_gift_queue/putAway', [$id, $queueState]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }
}
