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
class GameConfigService
{
    #[Inject]
    public GamesRepository $serviceGamesRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    // 套餐列表
    public function list($data)
    {
        return $this->serviceGamesRepository->request('games_config_smc/list', [$data]) ?? [];
    }

    public function listDefault($data)
    {
        return $this->serviceGamesRepository->request('games_config_smc/listDefault', [$data]) ?? [];
    }

    public function gameList($data)
    {
        return $this->serviceGamesRepository->request('games_config_smc/gameList', [$data]) ?? [];
    }

    public function fromGame($data)
    {
        return $this->serviceGamesRepository->request('games_config_smc/from_game', [$data]) ?? [];
    }

    public function saveRule($data)
    {
        return $this->serviceGamesRepository->request('games_config_smc/saveRule', [$data]) ?? [];
    }

    public function deleteRule($data)
    {
        return $this->serviceGamesRepository->request('games_config_smc/deleteRule', [$data]) ?? [];
    }

    public function gameStatusUpdate($post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('games_config_smc/gameStatusUpdate', [$post]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function sortUpdate($post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('games_config_smc/sortUpdate', [$post]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }
}
