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

use App\Game\Service\LuckGiftJackpotRankService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/luck-gift/jackpot-user-rank')]
class JackpotUserRankController extends MineController
{
    #[Inject]
    protected LuckGiftJackpotRankService $service;

    #[GetMapping('list')]
    public function list(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all() ?? [];
        $uid = $postData['uid'] ?? 0;
        $uid = empty($uid) ? 0 : $uid;
        return $this->success($this->service->getUserRankAllUsers($uid));
    }
}
