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

use App\Game\Service\LuckGiftQueueListService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PostMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/luck-gift/queue-list')]
class LuckGiftQueueListController extends MineController
{
    public const RATE_PRECISION = 4;   // 比率精确值

    #[Inject]
    protected LuckGiftQueueListService $service;

    /** 计算倍数对应的概率.
     */
    public function getMultipleOdds(array $params = []): array
    {
        $queueLength = $params['queue_length'];     // 队列长度
        $multiple = $params['multiple'] ?: [];  // 倍数
        $rateNumb = 0;

        $info = [];
        $lotteryNumb = 0;   // 实际中奖数
        foreach ($multiple as $key_mul => $val_mul) {
            $multiple = (int) trim($val_mul['multiple']);
            $multipleVal = (int) trim($val_mul['multiple_val']);

            $actualNumb = $multipleVal;
            $mul_chance = bcdiv((string) $actualNumb, (string) $queueLength, self::RATE_PRECISION);
            $lotteryNumb = $lotteryNumb + (int) bcmul((string) $actualNumb, (string) $multiple);

            $info[] = [
                'actual_numb' => $actualNumb,   // 倍数对应个数
                'mul_chance' => $mul_chance,    // 倍数对应比率
                'key_mul' => $key_mul,  // 倍数位置
                'val_mul' => $multiple,  // 倍数值
            ];
            if ($multipleVal && $multiple) {
                ++$rateNumb;
            }
        }

        $lotteryRate = bcdiv((string) $lotteryNumb, (string) $queueLength, self::RATE_PRECISION);
        $returnData['list'] = $info ?: [];
        $returnData['lottery_rate'] = $lotteryRate ?: 0;
        $returnData['rate_numb'] = $rateNumb ?: 0;

        return $returnData;
    }

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
    public function update(int $id, MineFormRequest $request): ResponseInterface
    {
        $params = $request->all();

        $configId = $params['config_id'];
        $queueLength = (int) trim($params['queue_length']);  // 队列长度
        $queueType = $params['type'];    // 类型 1-保存 2-查看期望值
        if (! $queueLength || $queueLength < 100) {
            return $this->error('请检查队列长度');
        }

        $multipleData = $this->getMultipleOdds($params);
        if (! $multipleData['rate_numb']) {
            return $this->error('倍数填写不规范~', 500, $multipleData);
        }
        if (bcsub(bcmul($multipleData['lottery_rate'], (string) 100), (string) 96) > 0 && $queueType == 1) {
            return $this->error('期望值设置过高~', 500, $multipleData);
        }

        if ($queueType == 1) {
            $editQueue = [
                'multiple_odds' => json_encode($multipleData['list']),
                'actual_odds' => $multipleData['lottery_rate'],
                'queue_length' => $queueLength,
            ];

            $this->service->editQueue($configId, $editQueue) ? $this->success() : $this->error($this->service->getErrMsg());
        }

        return $this->success();
    }

    #[PutMapping('put-away/{id}')]
    public function putAway(int $id, MineFormRequest $request): ResponseInterface
    {
        $params = $request->all();
        $configId = $params['config_id'];
        $queueStatus = $params['queue_status'];
        $queueState = $queueStatus == 1 ? 0 : 1;
        return $this->service->putAway($configId, $queueState) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PostMapping('save')]
    public function save(MineFormRequest $request): ResponseInterface
    {
        $all = $request->all();
        $giftId = $all['gift_id'];
        $giftId = (int) trim($giftId);
        return $this->service->save($giftId) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
